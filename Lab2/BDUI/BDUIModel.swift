//
//  BDUIModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 18.05.2025.
//

import Foundation

struct BDUIModel: Decodable {
    let type: ViewType
    let content: Content?
    let subviews: [BDUIModel]?
    
    enum ViewType: String, Decodable {
        case stackView
        case label
        case button
        case textField
    }
    
    struct Content: Decodable {
        private let values: [String: AnyCodable]
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            values = try container.decode([String: AnyCodable].self)
        }
        
        func string(forKey key: String) -> String? {
            return values[key]?.value as? String
        }
        
        func int(forKey key: String) -> Int? {
            return values[key]?.value as? Int
        }
        
        func float(forKey key: String) -> Float? {
            return values[key]?.value as? Float
        }
        
        func bool(forKey key: String) -> Bool? {
            return values[key]?.value as? Bool
        }
        
        func dictionary(forKey key: String) -> [String: Any]? {
            return values[key]?.value as? [String: Any]
        }
        
        func action(forKey key: String) -> ActionModel? {
            guard let actionDict = dictionary(forKey: key),
                  let type = actionDict["type"] as? String,
                  let actionType = ActionType(rawValue: type) else {
                return nil
            }
            
            return ActionModel(type: actionType, context: actionDict["context"] as? [String: Any])
        }
    }
}

struct AnyCodable: Decodable {
    let value: Any
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(String.self) {
            self.value = value
        } else if let value = try? container.decode(Int.self) {
            self.value = value
        } else if let value = try? container.decode(Double.self) {
            self.value = value
        } else if let value = try? container.decode(Bool.self) {
            self.value = value
        } else if let value = try? container.decode([String: AnyCodable].self) {
            var result = [String: Any]()
            value.forEach { result[$0] = $1.value }
            self.value = result
        } else if let value = try? container.decode([AnyCodable].self) {
            self.value = value.map { $0.value }
        } else {
            self.value = NSNull()
        }
    }
}

enum ActionType: String, Decodable {
    case print
    case navigate
    case reload
    case dismiss
}

struct ActionModel {
    let type: ActionType
    let context: [String: Any]?
}
