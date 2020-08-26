//
//  Produto.swift
//  SuperList
//
//  Created by Fabio on 25/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import Foundation


enum Categoria {
    case alimento
    case limpeza
}


struct Produto {
    var nome: String
    var preco: String
    var categoria: Categoria
}
