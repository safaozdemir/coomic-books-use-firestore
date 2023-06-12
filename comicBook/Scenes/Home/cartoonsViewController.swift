//
//  cartoonsViewController.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import UIKit

class cartoonsViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    private var viewModel = CartoonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        navigationItem.hidesBackButton = true

        viewModel.reloadData = {
            self.collectionView.reloadData()
        }

        viewModel.fetchCartoons()
    }
}

extension cartoonsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCartoons()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartoonCollectionViewCell", for: indexPath) as? CartoonCollectionViewCell {
            if let cartoon = viewModel.getCartoon(at: indexPath.row) {
                cell.showData(cartoon: cartoon)
                if let url = URL(string: cartoon.cartoonImage) {
                    cell.cartoonImage.loadImage(url: url)
                }
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.viewModel = DetailViewModel(name: viewModel.getCartoon(at: indexPath.row)!.cartoonName, imageURL: viewModel.getCartoon(at: indexPath.row)!.cartoonImage, numOfEp: viewModel.getCartoon(at: indexPath.row)!.numOfEp)

        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension cartoonsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 2) - 10, height: collectionView.frame.size.height / 2)
    }
}
