//
//  WeatherModuleWeatherModuleInteractorInput.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol WeatherModuleInteractorInput {
 func getWhetherData(forcity city:String, completion: @escaping (_ success:Bool) -> Void)
}
