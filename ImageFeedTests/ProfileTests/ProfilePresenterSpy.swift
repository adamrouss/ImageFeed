//
//  ProfilePresenterSpy.swift
//  ImageFeedTests
//
//  Created by AdamRouss on 14.06.2023.
//

import UIKit
import ImageFeed

final class ProfilePresenterSpy: ProfilePresenterProtocol {
    var profileService: ImageFeed.ProfileService
    var viewDidLoadCalled: Bool = true
    var isAlertShowed = false
    var view: ProfileViewControllerProtocol?
    
    init (profileService: ProfileService ) {
        self.profileService = profileService
    }
    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func getUrlForProfileImage() -> URL? {
        return URL(string: "https://unsplash.com")
    }
    
    func createAlert() -> UIAlertController {
        isAlertShowed = true
        return UIAlertController()
    }
}

