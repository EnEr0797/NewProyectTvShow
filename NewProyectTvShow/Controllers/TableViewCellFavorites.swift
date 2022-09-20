//
//  TableViewCellFavorites.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 18/09/22.
//

import UIKit

class TableViewCellFavorites: UITableViewCell {
    
    @IBOutlet weak var imgFavorites: UIImageView!
    @IBOutlet weak var nameFavorites: UILabel!
    @IBOutlet weak var cardFavorites: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cardFavorites.clipsToBounds = true
        self.cardFavorites.layer.cornerRadius = 15
        self.cardFavorites.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
