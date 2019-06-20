//
//  WeatherModuleWeatherModuleViewOutput.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//
import RxSwift

protocol WeatherModuleViewOutput {

    /**
        @author Kishore
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getWhetherData(forcity city:String, completion: @escaping (_ success:Bool) -> Void)
}
