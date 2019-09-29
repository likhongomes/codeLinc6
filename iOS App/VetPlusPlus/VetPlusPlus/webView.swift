//
//  webView.swift
//  VetPlusPlus
//
//  Created by Likhon Gomes on 9/29/19.
//  Copyright © 2019 Likhon Gomes. All rights reserved.
//

import UIKit
import WebKit

class webView: UIViewController , WKNavigationDelegate{

    let webKit = WKWebView()
    var urlLink = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //webViewSetup()
        
    }
    
    func webViewSetup()  {
        print("wkexecuted")
        view.addSubview(webKit)
        webKit.navigationDelegate = self
        view = webKit
        webKit.translatesAutoresizingMaskIntoConstraints = false
        webKit.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webKit.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webKit.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webKit.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let url = URL(string: "https://www.hackingwithswift.com")!
        webKit.load(URLRequest(url: url))
        webKit.allowsBackForwardNavigationGestures = true    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
