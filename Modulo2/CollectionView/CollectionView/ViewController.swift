//
//  ViewController.swift
//  CollectionView
//
//  Created by Fabio on 10/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    
    var arrayCarros:[Carro] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        self.arrayCarros = [Carro(modelo: "brasilia", ano: "1980", image: "brasilia.jpg"),
                            Carro(modelo: "fusca", ano: "1970", image: "fusca.jpg"),
                            Carro(modelo: "marea", ano: "1990", image: "marea.jpg"),
                            Carro(modelo: "passat", ano: "1980", image: "passat.jpg")]
        
        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarrosCollectionViewCell")
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayCarros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CarrosCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrosCollectionViewCell", for: indexPath) as? CarrosCollectionViewCell
        
        cell?.setupCell(carro: self.arrayCarros[indexPath.item])

        return cell ?? UICollectionViewCell()
    }
    
    
}
