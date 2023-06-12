//
//  EpDetailViewController.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//
import FirebaseFirestore
import UIKit


class EpDetailViewController: UIViewController {
    private var cartoonDocumentRef: DocumentReference!
    @IBOutlet var epDetailCollectionView: UICollectionView!
    var viewModel: EpDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Ep \(viewModel.numOfEp)"
        epDetailCollectionView.delegate = self
        epDetailCollectionView.dataSource = self
        epDetailCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

        viewModel.reloadData = {
            self.epDetailCollectionView.reloadData()
        }
        viewModel.getDataFromFirestore()
    }

    

    @IBAction func homeBtn(_ sender: Any) {
        performSegue(withIdentifier: "goToHome", sender: nil)
    }
}

extension EpDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCartoons().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpImageCell", for: indexPath) as? EpCollectionViewCell {
            var cartoon = viewModel.getCartoons()
            if let url = URL(string: cartoon[indexPath.row] as! String) {
                cell.EpImageView.loadImage(url: url)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension EpDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width) - 10, height: collectionView.frame.size.height*8)
    }

    
}

