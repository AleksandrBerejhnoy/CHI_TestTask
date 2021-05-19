//
//  DataManager.swift
//  CHI_Internship_Countries
//
//  Created by Pro on 17.05.2021.
//

import Foundation

final class DataManager {
    
    typealias ComplitionHandler = (Data?, URLResponse?, Error?) -> ()
    
    static func generateRequest(_ urlString: String, responce: @escaping ComplitionHandler) {
        let headers = [
            "x-rapidapi-key": "2c2f6c1755msh086bc32de7bfb47p1e328djsnd255a4736e04",
            "x-rapidapi-host": "restcountries-v1.p.rapidapi.com"
        ]
        
        guard let url = URL(string: urlString) else { return }
        
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: responce)
        dataTask.resume()
    }
}
