//
//  TableCell.swift
//  EncodeDecode
//
//  Created by Appinventiv mac on 22/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backgraoundimageview1: UIImageView!
    @IBOutlet weak var backgraoundimageView2: UIImageView!
    @IBOutlet weak var middleimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

