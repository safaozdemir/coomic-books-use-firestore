//
//  DetailViewModel.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import Foundation

class DetailViewModel {
    let name: String
    let imageURL: URL?
    var episodes: [Cartoon]

    init(name: String, imageURL: String, numOfEp: Int) {
        self.name = name
        self.imageURL = URL(string: imageURL)
        self.episodes = []
        for i in (1...numOfEp).reversed() {
            let episode = Cartoon(cartoonName: name, cartoonImage: imageURL, numOfEp: i)
            self.episodes.append(episode)
        }
    }
}
