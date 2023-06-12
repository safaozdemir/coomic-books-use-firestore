//
//  CartoonCollectionViewCell.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import UIKit

class CartoonCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cartoonImage: UIImageView!
    @IBOutlet var cartoonLabel: UILabel!
    private var imageUrl: String!

    func showData(cartoon: Cartoon) {
        cartoonLabel.text = cartoon.cartoonName
        imageUrl = cartoon.cartoonImage
    }
}


