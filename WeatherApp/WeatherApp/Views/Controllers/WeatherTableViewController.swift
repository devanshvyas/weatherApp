//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by Devansh Vyas on 02/05/22.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    var weatherList: [WeatherList] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var selectedIdx: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? WeatherDetailViewController,
        let idx = selectedIdx
        else { return }
        destinationVC.weatherModel = weatherList[idx]
    }
    
    func getData() {
        APIServices.shared.getWeatherLists { weatherModel, error in
            if let _ = error {
                
            } else {
                self.weatherList = weatherModel?.list ?? []
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        as? WeatherTableViewCell
        cell?.weatherModel = weatherList[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIdx = indexPath.row
        performSegue(withIdentifier: "toWeatherDetail", sender: nil)
    }
}
