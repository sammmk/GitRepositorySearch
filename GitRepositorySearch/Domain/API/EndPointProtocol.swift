//
//  EndPointProtocol.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import Foundation
///
///
///
protocol EndPointProtocol {
    var url: URL { get }
    var query: String { get }
}
///
///
///
extension EndPointProtocol {
    var urlRequest: URLRequest {
        let req = URLRequest(url: url)
        return req
    }
}

