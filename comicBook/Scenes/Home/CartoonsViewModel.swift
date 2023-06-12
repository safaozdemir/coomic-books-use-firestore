//
//  CartoonsViewModel.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import FirebaseFirestore
import Foundation

class CartoonViewModel {
    private let cartoonCollectionRef = Firestore.firestore().collection("mangalar")
    private var cartoons = [Cartoon]()

    var reloadData: (() -> Void)?

    func fetchCartoons() {
        cartoonCollectionRef.getDocuments { snapshot, error in
            if let error = error {
                debugPrint("error \(error.localizedDescription)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    let cartoonName = document.documentID
                    let cartoonImage = data["image"] as? String ?? ""
                    let numOfEp = data["bolumSayisi"] as? Int ?? 1
                    let newCartoon = Cartoon(cartoonName: cartoonName, cartoonImage: cartoonImage, numOfEp: numOfEp)
                    self.cartoons.append(newCartoon)
                }
                self.reloadData?()
            }
        }
    }

    func getCartoon(at index: Int) -> Cartoon? {
        if index >= 0 && index < cartoons.count {
            return cartoons[index]
        }
        return nil
    }

    func numberOfCartoons() -> Int {
        return cartoons.count
    }
}
