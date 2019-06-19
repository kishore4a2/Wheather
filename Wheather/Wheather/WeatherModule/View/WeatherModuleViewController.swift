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
    @IBOutlet var lbl: UILabel!
    @IBOutlet var tableView: UITableView!
        private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        self.getCitiesListFromFirebase()
    }
    @IBAction func click(_ sender: Any) {
        
        self.output.getWhetherData(forcity: "Melbourne")
    }
    func reloadDataWithWhetherResp(_ wheatherResp:WheatherResp) {
        self.lbl.text = wheatherResp.name
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
