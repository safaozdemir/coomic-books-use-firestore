//
//  CustomImageView.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 27.02.2023.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }

        task.resume()
    }
}
