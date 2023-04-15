//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by AdamRouss on 09.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private var nameLabel: UILabel?
    private var loginLabel: UILabel?
    private var descriptionlabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileImage = UIImage(named: "avatar")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
        self.nameLabel = nameLabel
        
        let loginLabel = UILabel()
        loginLabel.text = "@ekaterina_nov"
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        loginLabel.textColor = .lightGray
        loginLabel.font = UIFont.systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            loginLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        self.loginLabel = loginLabel
        
        let descriptionlabel = UILabel()
        descriptionlabel.text = "Hello, world!"
        descriptionlabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionlabel.textColor = .white
        view.addSubview(descriptionlabel)
        descriptionlabel.font = UIFont.systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            descriptionlabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            descriptionlabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        self.descriptionlabel = descriptionlabel
        
        let logoutButton = UIButton(type: .custom)
        logoutButton.setImage(UIImage(named: "logout_button"), for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
