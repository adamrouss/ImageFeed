//
//  TabBarController.swift
//  ImageFeed
//
//  Created by AdamRouss on 16.05.2023.
//
import UIKit

final class TabBarController: UITabBarController {
    override func awakeFromNib() {
        super.awakeFromNib()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        let imagesListViewController = storyboard.instantiateViewController(
            withIdentifier: "ImagesListViewController"
        )
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: nil,
                                                        image: UIImage(named: "tab_profile_active"),
                                                        selectedImage: nil)
        //profileViewController.view.backgroundColor = UIColor(hex: 0x1A1B22)
        self.viewControllers = [imagesListViewController, profileViewController]
    }
}
