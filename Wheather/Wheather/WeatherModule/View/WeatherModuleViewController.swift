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
import Toast_Swift

class WeatherModuleViewController: UIViewController, WeatherModuleViewInput {
    var output: WeatherModuleViewOutput!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityWeather: UILabel!
    @IBOutlet var cityWind: UILabel!
    @IBOutlet var cityTemp: UILabel!
    @IBOutlet var cityTime: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet var dropDownImage: UIImageView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        self.getCitiesListFromFirebase()
    }
    @IBAction func click(_ sender: Any) {
        if Constants.shared.citiList == nil {
            self.getCitiesListFromFirebase()
        }
        self.tableHeightConstraint.constant = (self.tableHeightConstraint.constant == 0) ? 200 :0
        let i = (self.tableHeightConstraint.constant == 0) ? 0 :180
        self.animateView(rotationdeg: Double(i))
        
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
                self.view.makeToastActivity(.center)
                self.output.getWhetherData(forcity: cityName, completion: { (success) in
                    self.view.hideToastActivity()
                    if(!success){
                        self.view.makeToast(Constants.noInternet, duration: 0.3, position: .bottom)
                    }
                })
            }
            .disposed(by: disposeBag)
    }

    func getCitiesListFromFirebase()  {
        FireBaseManager.shared.getCityListFromFirebase{(success) in
            if (success){
                self.reloadCityTableview()
            }else{
                self.view.makeToast(Constants.noInternet, duration: 0.3, position: .bottom)
            }
        }
    }
    func animateView(rotationdeg:Double)  {
        UIView.animate(withDuration: 0.3, animations: {
             self.dropDownImage.transform = CGAffineTransform(rotationAngle: CGFloat(rotationdeg * Double.pi / 180))
            self.view.layoutIfNeeded()
        }) { (finished) in
        }
    }
    // MARK: WeatherForecastViewInput
    func setupInitialState() {
        
    }
 
}
