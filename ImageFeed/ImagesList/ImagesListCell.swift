//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by AdamRouss on 08.04.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    static let reuseIdentifier = "ImagesListCell"
}
