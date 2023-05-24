//
//  Constants.swift
//  ImageFeed
//
//  Created by AdamRouss on 16.04.2023.
//

import UIKit

enum Constants {
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
