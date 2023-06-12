//
//  DetailTableViewCell.swift
//  comicBook
//
//  Created by Muhammed Safa Ozdemir on 25.02.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var EpTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
