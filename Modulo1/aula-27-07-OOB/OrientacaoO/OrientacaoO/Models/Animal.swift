//
//  Animal.swift
//  OrientacaoO
//
//  Created by Fabio on 09/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import Foundation

class Animal {

    var tamanho: String?
    var raca: String?
    var cor: String?
    var qtdPadas: Int?
    var genero: String?
    var especie: String?
    var idade: Int?
    
    
    init(tamanho: String, raca: String, cor: String, qtdPadas: Int, genero: String, especie: String, idade: Int) {
        
        self.tamanho = tamanho
        self.raca = raca
        self.cor = cor
        self.qtdPadas = qtdPadas
        self.genero = genero
        self.especie = especie
        self.idade = idade
        
    }
    
    
}



struct Animal2 {

    var tamanho: String?
    var raca: String?
    var cor: String?
    var qtdPadas: Int?
    var genero: String?
    var especie: String?
    var idade: Int?   
    
}
