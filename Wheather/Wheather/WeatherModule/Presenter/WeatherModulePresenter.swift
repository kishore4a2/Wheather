//
//  WeatherModuleWeatherModulePresenter.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

class WeatherModulePresenter: WeatherModuleModuleInput, WeatherModuleViewOutput, WeatherModuleInteractorOutput {

    weak var view: WeatherModuleViewInput!
    var interactor: WeatherModuleInteractorInput!
    var router: WeatherModuleRouterInput!

    func viewIsReady() {

    }
}
