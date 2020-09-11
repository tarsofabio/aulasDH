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

    
    @IBOutlet weak var myCollectionView2: UICollectionView!
    
    
    var arrayCarros:[Carro] = []
    var arrayMotos:[Moto] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        self.arrayCarros = [Carro(modelo: "brasilia", ano: "1980", image: "brasilia.jpg"),
                            Carro(modelo: "fusca", ano: "1970", image: "fusca.jpg"),
                            Carro(modelo: "marea", ano: "1990", image: "marea.jpg"),
                            Carro(modelo: "passat", ano: "1980", image: "passat.jpg")]
        
        
        
    
        
        self.arrayMotos = [Moto(modelo: "honda", ano: "1980", image: "honda.jpg"),
                            Moto(modelo: "yamaha", ano: "1970", image: "yamaha.jpg"),
                            Moto(modelo: "kawasaki", ano: "1990", image: "kawasaki.jpg"),
                            Moto(modelo: "harley", ano: "1980", image: "harley.jpg")]

        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarrosCollectionViewCell")
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        
        self.myCollectionView2.register(UINib(nibName: "MotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MotosCollectionViewCell")

        self.myCollectionView2.delegate = self
        self.myCollectionView2.dataSource = self
        
      
        
        // Do any additional setup after loading the view.
    }


}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView2(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return self.arrayMotos.count
           }
           

    func collectionView2(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               
               let cell2: MotosCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: "MotosCollectionViewCell", for: indexPath) as? MotosCollectionViewCell
               
               cell2?.setupCell(moto: self.arrayMotos[indexPath.item])

               return cell2 ?? UICollectionViewCell()
          }
    
       
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayCarros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CarrosCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrosCollectionViewCell", for: indexPath) as? CarrosCollectionViewCell
        
        cell?.setupCell(carro: self.arrayCarros[indexPath.item])

        return cell ?? UICollectionViewCell()
    }
    
    




    
}
