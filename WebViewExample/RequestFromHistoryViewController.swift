//
//  RequestFromHistoryViewController.swift
//  WebViewExample
//
//  Created by Никита Ничепорук on 6/24/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit
import WebKit

class RequestFromHistoryViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var historyRequst: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrapRequset = historyRequst else {return}
        guard let url = URL(string: "https://" + unwrapRequset) else {return}
            let requst = URLRequest(url: url)
            webView.load(requst)
    }
}
