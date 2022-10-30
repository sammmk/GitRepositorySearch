//
//  SearchViewModel.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import Foundation
import Combine
///
///
///
class SearchViewModel: ObservableObject {
    ///
    // MARK: -------------------- properties
    ///
    ///
    @Published var searchString: String = ""
    @Published var searchStringForAPI: String = ""
    @Published var errorMessage: String = ""
    @Published var repositories: [GitRepository] = []
    ///
    // MARK: -------------------- Life cycle
    ///
    ///
    func search(q: String) -> AnyPublisher<[GitRepository], Error> {
        self.searchStringForAPI = q
        let gitUrl = GitAPI(query: self.searchStringForAPI)
        
        let result = URLSession.shared.dataTaskPublisher(for: gitUrl.url)
            .tryMap {
                try JSONDecoder().decode(GithubSearchResult.self, from: $0.data).items
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        return result
    }
}
