//
//  ImagesListPresenter.swift
//  ImageFeed
//
//  Created by AdamRouss on 14.06.2023.
//

import UIKit

// MARK: - Protocols

protocol ImagesListPresenterProtocol: AnyObject {
    var view: ImagesListViewControllerProtocol? { get set }
    var photos: [Photo] { get }
    func presentPhotosNextPage()
    func presentChangeLikeResult(photo: Photo, completion: @escaping (Result<Void, Error>) -> Void)
}

// MARK: - ImagesListPresenter Class

final class ImagesListPresenter: ImagesListPresenterProtocol {
    
    // MARK: - Properties
    
    private let imagesListService: ImagesListServiceProtocol
    weak var view: ImagesListViewControllerProtocol?
    var photos: [Photo] {
        imagesListService.photos
    }
    
    // MARK: - Initializers
    
    init(viewController: ImagesListViewController, imagesListService: ImagesListServiceProtocol = ImagesListService.shared as! ImagesListServiceProtocol) {
        self.view = viewController as? any ImagesListViewControllerProtocol
        self.imagesListService = imagesListService
    }
    
    // MARK: - Methods
    
    func presentPhotosNextPage() {
        imagesListService.fetchPhotosNextPage { _ in }
    }
    
    func presentChangeLikeResult(photo: Photo, completion: @escaping (Result<Void, Error>) -> Void) {
        imagesListService.changeLike(photoId: photo.id, isLike: !photo.isLiked, completion)
    }
}

