//
//  DetailViewController.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet private weak var webView: WKWebView!
    var path: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: path)
        let urlRequest = URLRequest(url: url!)
        self.webView.load(urlRequest)
    }

}
