//
//  ViewController.swift
//  WebViewExample
//
//  Created by Никита Ничепорук on 6/22/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    var requestHist: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        addGestureBack()
        addGestureForward()
    }
    
    func unwrapField() -> String {
        guard let unwrapTextField = textField.text else {return ""}
       // UserDefaults.standard.set(unwrapTextField, forKey: "urlHistory")
        return unwrapTextField
    }
    
    @IBAction func searchAction(_ sender: Any) {
        if textField.text?.contains("https://") == false {
            guard let url = URL(string: "https://" + unwrapField()) else {return}
            let request = URLRequest(url: url)
            webView.load(request)
            requestHist.append(unwrapField())
            UserDefaults.standard.set(requestHist, forKey: "urlHistory")
            searchButton.alpha = 0
            textField.text = "\(request)"
        }
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func addNewPage(_ sender: Any) {
        
    }
    
    func addGestureBack() {
        let swipe = UISwipeGestureRecognizer(target: self,
                                             action: #selector(backPage))
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
    }
    
    @objc func backPage() {
        webView.goBack()
    }
    
    func addGestureForward() {
        let swipe = UISwipeGestureRecognizer(target: self,
                                             action: #selector(forwardPage))
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
    }
    
    @objc func forwardPage() {
        webView.goForward()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let histVC = segue.destination as? HistoryViewController else {return}
        histVC.arrayOfHistorySearch = requestHist
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        searchAction(true)
        return true
    }
}

