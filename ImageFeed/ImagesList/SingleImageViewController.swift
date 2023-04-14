//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by AdamRouss on 14.04.2023.
//

import UIKit

final class SingleImageViewController: UIViewController{
    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }
    
    
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    @IBAction private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
}