//
//  SearchView.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import SwiftUI
import Combine
///
///
///
struct SearchView: View {
    ///
    // MARK: -------------------- properties
    ///
    ///
    ///
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var isRepositoryFound: Bool = false
    ///
    @ObservedObject var viewModel = SearchViewModel()
    ///
    // MARK: -------------------- view
    ///
    ///
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack (alignment: .leading) {
                        /// Search field
                        TextField("Search here ...", text: $viewModel.searchString)
                            .frame(height: 40)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            .border(Color.gray, width: 2)
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        ///
                        /// for Search Querry display.
                        /// Used throttle to limit API call. Therefore input value and querry for the API call may be differ.
                        Text("Searching in Git for : \(viewModel.searchStringForAPI)")
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .onReceive(
                    viewModel.$searchString
                        .throttle(for: 2, scheduler: RunLoop.main, latest: true)) { inputVal in
                            if !inputVal.isEmpty {
                                self.viewModel.search(q: inputVal)
                                    .sink(receiveCompletion: { completion in
                                        viewModel.errorMessage = ""
                                        switch completion {
                                        case .finished:
                                            break
                                        case let .failure(error):
                                            viewModel.errorMessage = error.localizedDescription
                                            self.isRepositoryFound = false
                                        }
                                    }, receiveValue: { repos in
                                        if repos.count > 0 {
                                            self.isRepositoryFound = true
                                            viewModel.repositories = repos
                                        }
                                        else {
                                            self.isRepositoryFound = false
                                            viewModel.repositories.removeAll()
                                        }
                                        viewModel.errorMessage = ""
                                    })
                                    .store(in: &self.subscriptions)
                            }
                        }
                /// Search result
                List {
                    if self.isRepositoryFound {
                        ForEach(viewModel.repositories) { repo in
                            NavigationLink(
                                destination: WebView(gitRepositoryUrl: repo.htmlUrl)
                                    .navigationBarTitle(Text(repo.name))
                            ) {
                                RepoItemView(repository: repo)
                            }
                        }
                    }
                    else {
                        if viewModel.searchStringForAPI.isEmpty {
                            ErrorView(errorMessage: "Please input search querry")
                        }
                        else {
                            ErrorView(errorMessage: "No repos found for \(viewModel.searchStringForAPI) \n 🤷🏽 \(viewModel.errorMessage)")
                        }
                    }
                }
                .navigationBarTitle(
                    Text("Search In Github 🕵🏽‍♀️")
                )
            }
        }
    }
}
///
///
///
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
