//
//  WebViewController.swift
//  News App
//
//  Created by Ірина Зеліско on 14.03.2023.
//

import UIKit
import WebKit

final class WebViewController: UIViewController,WKNavigationDelegate {
        
        var webView: WKWebView!
        let urlString: String
        
        
        init(urlString: String) {
            self.urlString = urlString
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isTranslucent = false
    //        self.edgesForExtendedLayout = []
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
            webView.allowsBackForwardNavigationGestures = true
        }
        
        override func loadView() {
            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        }
        
    }
