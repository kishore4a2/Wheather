//
//  WeatherModuleWeatherModuleInteractor.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//
import RxSwift
import RxCocoa

class WeatherModuleInteractor: WeatherModuleInteractorInput {
    let semaphore = DispatchSemaphore(value: 0)
    var dataManager = DataManager()
    weak var output: WeatherModuleInteractorOutput!
    var weatherResp1 : WheatherResp!
    func getWhetherData(forcity city: String){
        self.dataManager.getWheather(forCity: city) { (dataResponse) in
             self.semaphore.signal()
            guard let wheatherResp = dataResponse.result.value else {
                return
            }
         self.output.gotWhetherResponse(wheatherResp)
        }
        
    }
}
