//
//  Parser.swift
//  WebViewExample
//
//  Created by Никита Ничепорук on 6/24/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import Foundation

let json = ""
class Parser {
    static func parseNamesFromJSON() -> Req? {
        let encoder = JSONEncoder()
        
        guard let path = Bundle.main.url(forResource: "JSON", withExtension: "json"),
            let jsonData = try? String(contentsOf: path).data(using: .utf8),
            let group: Req = try? encoder.encode(Req.self)(Req.self, from: jsonData!) else {
                print("Error here")
                return nil
        }
        return group
    }
}
