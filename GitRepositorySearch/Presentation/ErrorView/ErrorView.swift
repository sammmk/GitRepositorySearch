//
//  ErrorView.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/30.
//
import SwiftUI
///
///
///
struct ErrorView: View {
    ///
    // MARK: -------------------- properties
    ///
    ///
    public var errorMessage: String = ""
    ///
    // MARK: -------------------- View
    ///
    ///
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(.red)
            Text(errorMessage)
        }
    }
}

