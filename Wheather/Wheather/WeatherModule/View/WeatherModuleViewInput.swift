//
//  WeatherModuleWeatherModuleViewInput.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

protocol WeatherModuleViewInput: class {

    /**
        @author Kishore
        Setup initial state of the view
    */

    func setupInitialState()
    func reloadDataWithWhetherResp(_ wheatherResp:WheatherResp)
}
