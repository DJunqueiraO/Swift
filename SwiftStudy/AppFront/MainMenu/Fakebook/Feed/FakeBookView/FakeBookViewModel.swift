//
//  FakeBookViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import Foundation

protocol FakeBookViewModelDelegate: AnyObject {
    func fakeBookViewModel(_ post: FakeBookPost)
    func fakeBookViewModel(_ stories: [FakeBookStory])
    func fakeBookViewModel(_ perfilImage: String)
}

final class FakeBookViewModel {
    weak var delegate: FakeBookViewModelDelegate?
    private var perfil = FakeBookPerfil(image: "Gatsu", name: "Gatsu")
    private var posts: [FakeBookPost] = [] {
        didSet {
            for post in posts {
                delegate?.fakeBookViewModel(post)
            }
        }
    }
    private lazy var stories: [FakeBookStory] = [FakeBookStory(image: perfil.image, name: "Adicionar ao Story")] {
        didSet {
            delegate?.fakeBookViewModel(stories)
        }
    }
    private lazy var navigationCollectionView = FakeBookNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    func loadData() {
        Task {
            guard let posts = Network.read([FakeBookPost].self, from: "FakeBookPostsApi") else {return}
            self.posts = posts
        }
        Task {
            guard let stories = Network.read([FakeBookStory].self, from: "FakeBookStoriesApi") else {return}
            self.stories += stories
        }
        if let image = perfil.image {delegate?.fakeBookViewModel(image)}
    }
}
