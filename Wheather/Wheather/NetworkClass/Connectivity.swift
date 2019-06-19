//
//  Connectivity.swift
//  Wheather
//
//  Created by admin on 19/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
