//
//  MyTableViewCell.swift
//  NewProject
//
//  Created by Shreesha on 25/09/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
