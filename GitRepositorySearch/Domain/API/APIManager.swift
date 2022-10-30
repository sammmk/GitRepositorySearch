//
//  APIManager.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import Foundation
///
///
///
extension URL {
    static let repositorySearchURLString: String = "https://api.github.com/search/repositories?"
    static let sortString: String = "&sort=stars&order=desc"
}
///
///
///
public class GitAPI: EndPointProtocol {
    ///
    var url: URL
    var query: String
    var method = "GET"
    ///
    ///
    ///
    init(query: String) {
        ///
        guard let url = URL(string: URL.repositorySearchURLString + "q=\(query)" + URL.sortString)
        else {
            fatalError("Could not configure URL")
        }
        self.url = url
        self.query = query
    }
}

