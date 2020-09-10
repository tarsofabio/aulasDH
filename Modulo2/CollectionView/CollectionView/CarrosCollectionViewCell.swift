//
//  CarrosCollectionViewCell.swift
//  CollectionView
//
//  Created by Fabio on 10/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class CarrosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var carroimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(carro: Carro) {
        
        self.modeloLabel.text = carro.modelo
        self.anoLabel.text = carro.ano
        self.carroimageView.image = UIImage(named: carro.image ?? "")
        
    }

}
