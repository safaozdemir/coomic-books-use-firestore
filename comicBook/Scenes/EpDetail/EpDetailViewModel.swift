//
//  EpDetailViewModel.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import FirebaseFirestore
import Foundation

class EpDetailViewModel {
    private var cartoonDocumentRef: DocumentReference!
    private var cartoons = [String]()
    var numOfEp: Int

    init(name: String, numOfEp: Int) {
        self.numOfEp = numOfEp
        cartoonDocumentRef = Firestore.firestore().collection("mangalar").document("\(name)")
    }

    var reloadData: (() -> Void)?

    func getDataFromFirestore() {
        cartoonDocumentRef.getDocument { document, _ in
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            let dataDescription = document.data()!["\(self.numOfEp)"] as! [String]
            let detailEps = dataDescription.count
            for detailEp in 0 ... detailEps - 2 {
                let degisken = dataDescription[detailEp]
                self.cartoons.append(degisken)
            }
            self.reloadData?()
        }
    }

    func getCartoons() -> [String] {
        return cartoons
    }
}
