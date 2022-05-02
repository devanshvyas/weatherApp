//
//  APIService.swift
//  WeatherApp
//
//  Created by Devansh Vyas on 02/05/22.
//

import Foundation

class APIServices {
    
    static let shared = APIServices()
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=470c8555338be15ea713889016b3b4c0"
    
    func getWeatherLists(complete: @escaping ((Weather?, Error?) -> ())) {
        guard let url = URL(string: weatherUrl) else { return }
        let urlReq = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
            if let err = error {
                complete(nil, err)
            } else if let modelData = data  {
                do {
                    let weatherModel = try JSONDecoder().decode(Weather.self, from: modelData)
                    complete(weatherModel, nil)
                } catch (let error) {
                    complete(nil, error as NSError)
                    print(error)
                }
            }
            
        }
        task.resume()
    }
}
