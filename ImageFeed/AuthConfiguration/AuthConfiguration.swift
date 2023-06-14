//
//  AuthConfiguration.swift
//  ImageFeed
//
//  Created by AdamRouss on 16.04.2023.
//

import UIKit

struct Constants {
    //MARK: API
    static let accessKey = "Cx467gFkvALpQdZoYUMsDMtuAJ9hSNWlYwK77e4r0xw"
    static let secretKey = "9FJKZkyioNFpatROnxpMAw-hq7OPSETUPm6xrfMX9Xs"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    
    //MARK: Basic path & Storage
    static let defaultApiBaseURLString = "https://api.unsplash.com"
    static let baseURLString = "https://unsplash.com"
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    static let baseAuthTokenPath = "/oauth/token"
    static let bearerToken = "bearerToken"
}

struct AuthConfiguration {
    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let defaultBaseURL: URL
    let authURLString: String
    
    init(accessKey: String, secretKey: String, redirectURI: String, accessScope: String, defaultBaseURL: URL, authURLString: String) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.redirectURI = redirectURI
        self.accessScope = accessScope
        self.defaultBaseURL = defaultBaseURL
        self.authURLString = authURLString
    }
    
    static var standard: AuthConfiguration {
        return AuthConfiguration(
            accessKey: Constants.accessKey,
            secretKey: Constants.secretKey,
            redirectURI: Constants.redirectURI,
            accessScope: Constants.accessScope,
            defaultBaseURL: URL(string: "APIConstants.defaultApiBaseURLString")!,
            authURLString: Constants.unsplashAuthorizeURLString)
    }
}



