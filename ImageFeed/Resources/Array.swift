//
//  Array.swift
//  ImageFeed
//
//  Created by AdamRouss on 01.06.2023.
//

import UIKit

extension Array {
    func withReplaced(itemAt: Int, newValue: Photo) -> [Photo] {
        var photos = ImagesListService.shared.photos
        photos.replaceSubrange(itemAt...itemAt, with: [newValue])
        return photos
    }
}
