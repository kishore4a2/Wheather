//
//  WeatherModuleWeatherModuleInteractor.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//
import RxSwift
import RxCocoa
import CoreData
import Sync
import ObjectMapper

class WeatherModuleInteractor: WeatherModuleInteractorInput {
    private let dataStack: DataStack
    var dataManager = DataManager()
    weak var output: WeatherModuleInteractorOutput!
    
    init() {
        self.dataStack = DataStack(modelName: "Wheather")
    }
    func getWhetherData(forcity city: String){
         if Connectivity.isConnectedToInternet() {
            self.dataManager.getWheather(forCity: city) { (dataResponse) in
                guard let wheatherResp = dataResponse.result.value else {
                    return
                }
                self.output.gotWhetherResponse(wheatherResp)
                try! self.dataStack.insertOrUpdate(wheatherResp.dummyJson?.JSON ?? [:], inEntityNamed: "WeatherRespEntity")
            }
         }else{
            var fetchResp = [WeatherRespEntity]()
            fetchResp = self.offlineFetchWeatherJson(for: city)
            if (fetchResp.count > 0){
                let dictionary = fetchResp[0].export()
                let offlineWeatherDetails = Mapper<WheatherResp>().map(JSONObject:dictionary)
                self.output.gotWhetherResponse(offlineWeatherDetails!)
            }
        }
    }
    func offlineFetchWeatherJson(for city:String) -> [WeatherRespEntity] {
        let request: NSFetchRequest<WeatherRespEntity> = WeatherRespEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", city)
        return try! self.dataStack.viewContext.fetch(request)
    }
}
