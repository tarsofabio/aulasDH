//
//  MotosCollectionViewCell.swift
//  CollectionView
//
//  Created by Fabio on 10/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class MotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var motoimageView: UIImageView!
    
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        func setupCell(moto: Moto) {
            
            self.modeloLabel.text = moto.modelo
            self.anoLabel.text = moto.ano
            self.motoimageView.image = UIImage(named: moto.image ?? "")
            
        }

    }
