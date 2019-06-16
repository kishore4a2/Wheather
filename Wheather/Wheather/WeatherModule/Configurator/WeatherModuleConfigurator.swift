//
//  WeatherModuleWeatherModuleConfigurator.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import UIKit

class WeatherModuleModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WeatherModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: WeatherModuleViewController) {

        let router = WeatherModuleRouter()

        let presenter = WeatherModulePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = WeatherModuleInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
