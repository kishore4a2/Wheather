//
//  FireBaseManager.swift
//  Wheather
//
//  Created by admin on 19/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//

import UIKit
import Firebase
import ObjectMapper
import AlamofireObjectMapper
import CoreData
import Sync
class FireBaseManager: NSObject {
    static let shared = FireBaseManager()
    private let dataStack: DataStack
    override init() {
        self.dataStack = DataStack(modelName: "Wheather")
    }
    func getCityListFromFirebase(completion: @escaping () -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        if Connectivity.isConnectedToInternet() {
           appDelegate.remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
            appDelegate.remoteConfig.fetch(withExpirationDuration: 0) { (status, error) in
                 if status == RemoteConfigFetchStatus.success {
                     RemoteConfig.remoteConfig().activateFetched()
                     let jsonData = RemoteConfig.remoteConfig().configValue(forKey: "cityList").dataValue
                        let responseModel = Mapper<CitiesModel>().map(JSONString:String(decoding: jsonData, as: UTF8.self))
                    
                    self.dataStack.sync([responseModel?.dummyJson?.JSON ?? [:]], inEntityNamed: "CityEntity") { error in
                        if (error == nil){
                            print("success")
                            }
                        }
                        Constants.shared.appid = RemoteConfig.remoteConfig().configValue(forKey: "appid").stringValue
                        Constants.shared.baseURL = RemoteConfig.remoteConfig().configValue(forKey: "baseURL").stringValue
                        Constants.shared.citiList = responseModel?.cities
                        completion()
                }
            }
        }else
        {
            let request: NSFetchRequest<CityEntity> = CityEntity.fetchRequest()
            let offlineFetch = try! self.dataStack.viewContext.fetch(request)
            var dictionary = offlineFetch[0].export()
            
            if #available(iOS 12.0, *) {
                guard let unarchivedCities = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(offlineFetch[0].cities!)
                    else {
                        return
                }
                dictionary["cities"] = unarchivedCities as! [String]
            } else {
                if let unarchivedCities = NSKeyedUnarchiver.unarchiveObject(with: offlineFetch[0].cities!) as? [String] {
                    dictionary["cities"] = unarchivedCities
                }
            }
            let ppp = Mapper<CitiesModel>().map(JSONObject:dictionary)
            Constants.shared.citiList = ppp?.cities;
            completion()
        }
       
    }
}

