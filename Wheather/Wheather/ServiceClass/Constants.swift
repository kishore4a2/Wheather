//
//  Constants.swift
//  Wheather
//
//  Created by admin on 16/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//

import UIKit
import Foundation

class Constants: NSObject
{
     var baseURL: String?
     var appid: String?
     var citiList :[String]?
     static let shared = Constants()
    static let noInternet = "No Internet"
}
