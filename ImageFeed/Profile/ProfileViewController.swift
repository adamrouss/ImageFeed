//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by AdamRouss on 09.04.2023.
//

import UIKit
import Kingfisher
import WebKit

public protocol ProfileViewControllerProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol { get set }
    func updateAvatar()
    func showLogOutAlert()
}

final class ProfileViewController: UIViewController, ProfileViewControllerProtocol {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    lazy var presenter: ProfilePresenterProtocol = {
        return ProfilePresenter()
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Екатерина Новикова"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "@ekaterina_nov"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let logoutButton: UIButton = {
        let logoutButton = UIButton()
        logoutButton.accessibilityIdentifier = "logoutButton"
        logoutButton.setImage(Images.logout_Button, for: .normal)
        logoutButton.addTarget(self, action: #selector(didTappedExitButton), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        return logoutButton
    }()
    
    
    @objc private func didTappedExitButton() {
        showLogOutAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let profile = ProfileService.shared.profile else { return }
        updateProfileUIData(profile: profile)
        presenter.viewDidLoad()
        addSubviews()
        applyConstraints()
        updateAvatar()
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(loginLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(logoutButton)
        
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            loginLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26),
            logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
            
            
        ])
    }
    
    func showLogOutAlert() {
        let alert = presenter.createAlert()
        present(alert, animated: true, completion: nil)
    }
    
    func updateAvatar() {
        guard let url = presenter.getUrlForProfileImage() else { return }
        let processor = RoundCornerImageProcessor(cornerRadius: 61)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "person_crop_circle_fill"), options: [.processor(processor)])
        imageView.layer.cornerRadius = 36
        imageView.layer.masksToBounds = true
        let cache = ImageCache.default
        cache.clearDiskCache()
        cache.clearMemoryCache()
    }
}
extension ProfileViewController {
    func updateProfileUIData(profile: Profile) {
        DispatchQueue.main.async {
            self.nameLabel.text = profile.name
            self.descriptionLabel.text = profile.bio
            self.loginLabel.text = profile.loginName
        }
    }
}

