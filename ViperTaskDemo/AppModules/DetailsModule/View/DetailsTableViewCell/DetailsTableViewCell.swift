//
//  DetailsTableViewCell.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 02/05/2024.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {


    @IBOutlet weak var m_nameLabel: UILabel!
    
    @IBOutlet weak var m_stateLabel: UILabel!
    
    @IBOutlet weak var m_countryLabel: UILabel!
    
    @IBOutlet weak var m_countryCodeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
