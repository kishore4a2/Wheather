//
//  WeatherModuleWeatherModuleViewController.swift
//  Wheather
//
//  Created by Kishore on 16/06/2019.
//  Copyright © 2019 11street. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherModuleViewController: UIViewController, WeatherModuleViewInput {
    
    
    var output: WeatherModuleViewOutput!
    @IBOutlet var lbl: UILabel!
    
    private let disposeBag = DisposeBag()
    let dispatchTimeInterval = DispatchTimeInterval.seconds(Int(0.5))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    @IBAction func click(_ sender: Any) {
        
        self.output.getWhetherData(forcity: "Melbourne")
    }
    func reloadDataWithWhetherResp(_ wheatherResp:WheatherResp) {
        self.lbl.text = wheatherResp.name
    }
    
    // MARK: WeatherForecastViewInput
    func setupInitialState() {
        
    }
 
}
