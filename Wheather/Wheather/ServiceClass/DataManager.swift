//
//  DataManager.swift
//  Wheather
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

protocol DataManagerProtocol {
    func getWheather(forCity city: String, completionHandler: @escaping (DataResponse<WheatherResp>)->())
}
class DataManager: DataManagerProtocol {
 
    func getWheather(forCity city: String, completionHandler: @escaping (DataResponse<WheatherResp>) -> ()) {
        let parameters = ["q" : city, "appid" : Constants.appId]
        let url = Constants.baseUrl
        Alamofire.request(url, parameters: parameters).responseObject { (response: DataResponse<WheatherResp>) in
            completionHandler(response)
        }
    }
}
