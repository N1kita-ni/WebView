//
//  HistoryViewController.swift
//  WebViewExample
//
//  Created by Никита Ничепорук on 6/24/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit
import WebKit

class HistoryViewController: UIViewController {

    var arrayOfHistorySearch: [String] = []
    var currentSelectIndex = -1 
    @IBOutlet weak var tableHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableHistory.delegate = self
        tableHistory.dataSource = self
       //arrayOfHistorySearch.append("\(UserDefaults.standard.string(forKey: "urlHistory") ?? "xyeta")")
    }
    
    @IBAction func clearButton(_ sender: Any) {
        if arrayOfHistorySearch.isEmpty == false {
        let alert = UIAlertController(title: "История",
                                      message: "Вся история будет удалена?",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok",
                               style: .destructive) { (alert) in
                                self.arrayOfHistorySearch.removeAll()
                                self.tableHistory.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let requstVC = segue.destination as? RequestFromHistoryViewController else {
            return
        }
        requstVC.historyRequst = arrayOfHistorySearch[currentSelectIndex]
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfHistorySearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentReqest = arrayOfHistorySearch[indexPath.row]
        let cell = tableHistory.dequeueReusableCell(withIdentifier: "History")
        cell?.textLabel?.text = currentReqest
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelectIndex = indexPath.row
        performSegue(withIdentifier: "again", sender: nil)
    }
}
