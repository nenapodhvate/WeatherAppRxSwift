//
//  URLRequestExtensions.swift
//  WeatherAppRxSwift
//
//  Created by shin on 23.04.21.
//

import UIKit
import RxSwift
import RxCocoa

struct Resource<T> {
    let url: URL
}

extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0, humidity: 0, feels_like: 0), name: "Couldn't find the city", weather: [Condition.init(id: 0, main: "")], dt: TimeInterval(0), timezone: 0, coord: Coordinates(lat: 0, lon: 0) )
    }
}

extension URLRequest {
    
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { (data) -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
