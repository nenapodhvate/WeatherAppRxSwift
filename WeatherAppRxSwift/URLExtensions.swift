//
//  URLExtansions.swift
//  WeatherAppRxSwift
//
//  Created by shin on 23.04.21.
//

import UIKit
import RxSwift
import RxCocoa

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=da2eb5002d9bdfeb660e341eafb16cba&units=metric")
    }
    
    static func urlForWeatherAPICoordinates(lat: String, lon: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=da2eb5002d9bdfeb660e341eafb16cba&units=metric")
    }
}
