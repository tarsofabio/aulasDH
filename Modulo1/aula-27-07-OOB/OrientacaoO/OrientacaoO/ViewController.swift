//
//  ViewController.swift
//  OrientacaoO
//
//  Created by Fabio on 09/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animal: Animal = Animal(tamanho: "Grande", raca: "Golden", cor: "Branco", qtdPadas: 4, genero: "Macho", especie: "Cachorro", idade: 5)
        
        print(animal.raca)
        
        var animal2: Animal2 = Animal2(tamanho: "pequeno", raca: "PitBull", cor: "Cinza", qtdPadas: 4, genero: "Macho", especie: "Cachorro", idade: 4)
                
        
        // Do any additional setup after loading the view.
    }


}

