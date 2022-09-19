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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
