//
//  UrlSessionProtocol.swift
//  UrlWithCuckoo
//
//  Created by Serge Sukhanov on 3/28/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Foundation

protocol UrlSessionProtocol {
    var url: URL? { get set }
    var session: URLSession? { get set }
    var apiUrl: String? { get set }
    
    func getSourceUrl(apiUrl:String) -> URL
    func callApi(url:URL) -> String
}
