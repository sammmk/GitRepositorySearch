//
//  WebView.swift
//  GitRepositorySearch
//
//  Created by Mohan Kurera on 2022/10/28.
//
import SafariServices
import SwiftUI
///
///
///
struct WebView: UIViewControllerRepresentable {
    ///
    let gitRepositoryUrl: URL
    ///
    ///
    ///
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<WebView>
    ) -> SFSafariViewController
    {
        return SFSafariViewController(url: gitRepositoryUrl)
    }
    ///
    ///
    ///
    func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<WebView>)
    {
        
    }
}

