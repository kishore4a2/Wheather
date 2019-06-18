//
//  WeatherModuleWeatherModulePresenter.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import RxSwift
import RxCocoa

class WeatherModulePresenter: WeatherModuleModuleInput, WeatherModuleViewOutput, WeatherModuleInteractorOutput {

    weak var view: WeatherModuleViewInput!
    var interactor: WeatherModuleInteractorInput!
    var router: WeatherModuleRouterInput!

    func viewIsReady() {

    }
    func getWhetherData(forcity city: String) {
         self.interactor.getWhetherData(forcity: city)
    }
    func gotWhetherResponse(_ whetherResp: WheatherResp) {
        self.view.reloadDataWithWhetherResp(whetherResp)
    }
  
}
