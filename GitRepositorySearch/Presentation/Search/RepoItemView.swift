//
//  RepoItemView.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//

import SwiftUI

struct RepoItemView: View {
    ///
    // MARK: -------------------- properties
    ///
    ///
    let repository: GitRepository
    ///
    // MARK: -------------------- View
    ///
    ///
    var body: some View {
        ///
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "folder.fill.badge.person.crop")
                Text(repository.name)
                    .bold()
            }
            ///
            repository.description
                .map(Text.init)?
                .lineLimit(nil)
            ///
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(repository.stargazersCount)")
            }
        }
    }
}
