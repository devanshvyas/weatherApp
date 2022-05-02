//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Devansh Vyas on 02/05/22.
//

import UIKit


class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var weatherModel: WeatherList? {
        didSet {
            dateLabel.text = weatherModel?.dtTxt
            tempLabel.text = String(weatherModel?.main.tempMax ?? 0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowRadius = 5
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowOpacity = 0.5
    }
}
