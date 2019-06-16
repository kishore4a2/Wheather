//
//  WeatherModuleWeatherModuleViewController.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import UIKit

class WeatherModuleViewController: UIViewController, WeatherModuleViewInput {

    var output: WeatherModuleViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: WeatherModuleViewInput
    func setupInitialState() {
    }
}
