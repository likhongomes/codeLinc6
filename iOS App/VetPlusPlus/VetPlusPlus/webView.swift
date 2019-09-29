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
    let backButton = UIButton()
    var urlLink = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        webViewSetup()
        //backButtonSetup()
    }
    
    func webViewSetup()  {
        print("wkexecuted")
        view.addSubview(webKit)
        webKit.navigationDelegate = self
        view = webKit
        webKit.translatesAutoresizingMaskIntoConstraints = false
        //webKit.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //webKit.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //webKit.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //webKit.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let url = URL(string: urlLink)!
        webKit.load(URLRequest(url: url))
        webKit.allowsBackForwardNavigationGestures = true
    }
    
    func backButtonSetup() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.backgroundColor = .clear
    
        backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backButton.setTitle("Back", for: .normal)
        //backButton.backgroundColor = .blue
        //backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        //backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
