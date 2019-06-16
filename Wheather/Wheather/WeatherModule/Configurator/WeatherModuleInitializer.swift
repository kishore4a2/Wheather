//
//  WeatherModuleWeatherModuleInitializer.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import UIKit

class WeatherModuleModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var weathermoduleViewController: WeatherModuleViewController!

    override func awakeFromNib() {

        let configurator = WeatherModuleModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: weathermoduleViewController)
    }

}
