//
//  DetailViewController.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    var viewModel: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = viewModel.name
        if let url = viewModel.imageURL {
            imageView.loadImage(url: url)
        }

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? DetailTableViewCell {
            let episode = viewModel.episodes[indexPath.row]
            tableCell.EpTitle.text = "ep:\(episode.numOfEp)"
            return tableCell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EpDetailViewController") as? EpDetailViewController
        vc?.viewModel = EpDetailViewModel(name: viewModel.episodes[indexPath.row].cartoonName, numOfEp: viewModel.episodes[indexPath.row].numOfEp)
        self.navigationController?.pushViewController(vc!, animated:true)
    }
}
