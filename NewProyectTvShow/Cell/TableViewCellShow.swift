//
//  TableViewCellShow.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 16/09/22.
//

import UIKit

class TableViewCellShow: UITableViewCell {
    
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var titleShow: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.card.clipsToBounds = true
        self.card.layer.cornerRadius = 15
        self.card.backgroundColor = UIColor.lightGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
