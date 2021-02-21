//
//  SafariView.swift
//  SexyCV
//
//  Created by Jean martin Kyssama on 21/02/2021.
//

import SwiftUI
import SafariServices

struct SafaryView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafaryView>) -> SFSafariViewController {
        
        //we pass on the url parameter to this function
        SFSafariViewController(url: url)
    }
    //
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<SafaryView>) {}
    
    
}
