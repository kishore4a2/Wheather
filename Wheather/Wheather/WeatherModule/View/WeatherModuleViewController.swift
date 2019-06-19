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
import FirebaseCore
import FirebaseFirestore

class WeatherModuleViewController: UIViewController, WeatherModuleViewInput {
    var output: WeatherModuleViewOutput!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityWeather: UILabel!
    @IBOutlet var cityWind: UILabel!
    @IBOutlet var cityTemp: UILabel!
    @IBOutlet var cityTime: UILabel!
    @IBOutlet var tableView: UITableView!
        private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        self.getCitiesListFromFirebase()
    }
    @IBAction func click(_ sender: Any) {
        
    }
    func reloadDataWithWhetherResp(_ wheatherResp:WheatherResp) {
        if let cityName = wheatherResp.name {
             self.cityName.text = cityName
        }
        self.cityWind.text = String(format: "%.2f", wheatherResp.wind?.speed ?? 0)
        self.cityTemp.text = String(format: "%.2f", wheatherResp.main?.temp ?? 0)
        let time = Date(timeIntervalSince1970:TimeInterval (wheatherResp.dt ?? 0))
        self.cityTime.text = time.dateToString()
        if let weatherDesp = wheatherResp.weather?[0].main {
             self.cityWeather.text = weatherDesp
        }
    }
  
    fileprivate func reloadCityTableview() {
        
        let data = Observable<[String]>.just(Constants.shared.citiList!)
        
        data.bind(to: self.tableView.rx.items(cellIdentifier: "citycell", cellType: CityCell.self)) { index, model, cell in
            cell.cityName?.text = model
            }
            .disposed(by: self.disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(String.self))
            .bind { [unowned self] indexPath, cityName in
                self.tableView.deselectRow(at: indexPath, animated: true)
                self.output.getWhetherData(forcity:cityName)
            }
            .disposed(by: disposeBag)
    }

    func getCitiesListFromFirebase()  {
        FireBaseManager.shared.getCityListFromFirebase{
            self.reloadCityTableview()
        }
    }
    
    // MARK: WeatherForecastViewInput
    func setupInitialState() {
        
    }
 
}
