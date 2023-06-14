//
//  ProfileViewControllerSpy.swift
//  ImageFeedTests
//
//  Created by AdamRouss on 14.06.2023.
//

import UIKit
import ImageFeed

final class ProfileViewControllerSpy: ProfileViewControllerProtocol {
    var presenter: ImageFeed.ProfilePresenterProtocol
    var updateChanged = false
    var alertShown = false
    
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateAvatar() {
        updateChanged = true
    }
    
    func showLogOutAlert() {
        let alert = presenter.createAlert()
        
        
    }
}
