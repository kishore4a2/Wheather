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
class FireBaseManager: NSObject {
    static let shared = FireBaseManager()
    
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
                        Constants.shared.appid = RemoteConfig.remoteConfig().configValue(forKey: "appid").stringValue
                        Constants.shared.baseURL = RemoteConfig.remoteConfig().configValue(forKey: "baseURL").stringValue
                        Constants.shared.citiList = responseModel?.cities
                        completion()
                }
            }
        }
       
    }
    
}

