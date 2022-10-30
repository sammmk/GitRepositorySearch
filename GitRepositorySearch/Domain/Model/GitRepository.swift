//
//  GitRepository.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import Foundation
///
///
///
struct GithubSearchResult: Codable {
    let items: [GitRepository]
}
///
///
///
struct GitRepository: Codable, Identifiable, Equatable {
    ///
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    let htmlUrl: URL
    ///
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
        case htmlUrl = "html_url"
    }
}

