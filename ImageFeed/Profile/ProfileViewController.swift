//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by AdamRouss on 09.04.2023.
//

import UIKit
import Kingfisher
import WebKit

final class ProfileViewController: UIViewController {
    
    private let profileImageService = ProfileImageService.shared
    private let alertPresenter = AlertPresenter()

    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Екатерина Новикова"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "@ekaterina_nov"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let logoutButton: UIButton = {
        let logoutButton = UIButton()
        logoutButton.setImage(Images.logout_Button, for: .normal)
        logoutButton.addTarget(self, action: #selector(didTappedExitButton), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        return logoutButton
    }()
    
    private var profileImageServiceObserver: NSObjectProtocol?
    
    @objc private func didTappedExitButton() {
        let yesAction = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.logOutFromProfile()
        }
        
        let noAction = UIAlertAction(title: "Нет", style: .default)
        
        alertPresenter.prepeareAlertForExit(
            alertTitle: "Пока, пока!",
            alertMessage:"Уверены, что хотите выйти?",
            alertActions: [yesAction, noAction])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let profile = ProfileService.shared.profile else { return }
        updateProfileUIData(profile: profile)
        addSubviews()
        applyConstraints()
        alertPresenter.delegate = self
        profileImageServiceObserver = NotificationCenter.default.addObserver(
            forName: ProfileImageService.didChangeNotification,
            object: nil,
            queue: .main
        ){ [weak self] _ in
            guard let self = self else { return }
            self.updateAvatar()
        }
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
    
    private func updateAvatar() {
        guard
            let profileImageURl = ProfileImageService.shared.avatarURL,
            let url = URL(string: profileImageURl)
        else { return }
        imageView.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 61)
        imageView.kf.setImage(with: url, options: [.processor(processor)])
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
extension ProfileViewController {
    private func cleanCookie() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record]) { }
            }
        }
    }
    
    private func cleanStorage() {
        OAuth2TokenStorage.shared.removeToken()
    }
    
    private func logOutFromProfile() {
        cleanCookie()
        cleanStorage()
        
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid configuration")
            return
        }
        let splashVC = SplashViewController()
        window.rootViewController = splashVC
    }
}

extension ProfileViewController: AlertPresenterDelegate {
    func showAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
}

