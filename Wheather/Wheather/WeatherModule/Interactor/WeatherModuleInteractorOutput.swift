//
//  WeatherModuleWeatherModuleInteractorOutput.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import Foundation

protocol WeatherModuleInteractorOutput: class {
    func gotWhetherResponse(_ whetherResp:WheatherResp)
}