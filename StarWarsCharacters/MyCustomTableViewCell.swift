//
//  MyCustomTableViewCell.swift
//  StarWarsCharacters
//
//  Created by Mitch Praag on 6/5/18.
//  Copyright © 2018 Mitch Praag. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var characterImage: UIView!
    @IBOutlet weak var characterName: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
