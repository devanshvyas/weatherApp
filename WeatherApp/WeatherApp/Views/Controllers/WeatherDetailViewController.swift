//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Devansh Vyas on 02/05/22.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var seaLevelLbl: UILabel!
    @IBOutlet weak var grandLevelLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var degLbl: UILabel!
    @IBOutlet weak var gustLbl: UILabel!
    
    var weatherModel: WeatherList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI() {
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowRadius = 5
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowOpacity = 0.5
        
        dateLbl.text = weatherModel?.dtTxt ?? "nil"
        tempLbl.text = String(weatherModel?.main.temp ?? 0)
        minTempLbl.text = String(weatherModel?.main.tempMin ?? 0)
        maxTempLbl.text = String(weatherModel?.main.tempMax ?? 0)
        pressureLbl.text = String(weatherModel?.main.pressure ?? 0)
        seaLevelLbl.text = String(weatherModel?.main.seaLevel ?? 0)
        grandLevelLbl.text = String(weatherModel?.main.grndLevel ?? 0)
        humidityLbl.text = String(weatherModel?.main.humidity ?? 0)
        weatherLbl.text = weatherModel?.weather.first?.main ?? "nil"
        speedLbl.text = String(weatherModel?.wind.speed ?? 0)
        degLbl.text = String(weatherModel?.wind.deg ?? 0)
        gustLbl.text = String(weatherModel?.wind.gust ?? 0)
    }
    
    @IBAction func onLocationPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toMapView", sender: nil)
    }

}
