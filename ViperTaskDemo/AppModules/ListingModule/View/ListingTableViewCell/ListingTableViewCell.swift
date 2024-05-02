//
//  ListingTableViewCell.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import UIKit

class ListingTableViewCell: UITableViewCell {
    @IBOutlet weak var m_universityNameLabel: UILabel!
    
    @IBOutlet weak var m_universityStateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
