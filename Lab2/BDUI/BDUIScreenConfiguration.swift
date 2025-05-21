//
//  BDUIScreenConfiguration.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 21.05.2025.
//

import Foundation

struct BDUIScreenConfiguration {
    let endpoint: String
    let title: String?
    let httpMethod: String?
    let body: Data?
    
    init(endpoint: String, title: String? = nil, httpMethod: String? = nil , body: Data? = nil) {
        self.endpoint = endpoint
        self.title = title
        self.httpMethod = httpMethod
        self.body = body
    }
}

