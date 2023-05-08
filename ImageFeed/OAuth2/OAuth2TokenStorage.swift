//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by AdamRouss on 17.04.2023.
//

import UIKit

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()

    var token: String? {
        get {
            guard let token = userDefaults.string(forKey: Keys.token.rawValue) else {
                print("Нет токена в UserDefaults")
                return nil
            }
            return token
        }
        set {
            userDefaults.set(newValue, forKey: Keys.token.rawValue)
        }
    }
    
    private enum Keys: String {
        case token
    }
    
    private let userDefaults = UserDefaults.standard
}

