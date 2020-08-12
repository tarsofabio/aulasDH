//
//  CalculadoraView.swift
//  CalculadoraIMC
//
//  Created by Fabio on 10/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit
import Foundation

protocol CalculadoraViewProtocol: class {
    
    func successCalcIMC(value: String)
    func failureCalcIMC(msg: String)
}

class CalculadoraView: UIView {
    
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    
    weak var delegate: CalculadoraViewProtocol?
    func setupView(color: UIColor) {
        
        self.alturaTextField.placeholder = "Altura"
        self.pesoTextField.placeholder  = "Peso"
        self.backgroundColor = color
        
    }
    
    
    func calcularIMC() {
        
        
        let height: Float = Float(self.alturaTextField.text ?? "" ) ?? 0
        let weight: Float = Float(self.pesoTextField.text ?? "" ) ?? 0
        var result: String = "Não conseguimos calcular"
        
        
        if height <= 0 || weight <= 0 {
            self.delegate?.failureCalcIMC(msg: result)
        } else {
            
            
            
            let height2 = height * height
            let imc = weight/height2
            
            
            
            if imc < 16 {
                result = "Abaixo do peso"
            } else if imc >= 19 && imc < 25 {
                result = "Peso normal"
            } else if imc >= 25 && imc < 30 {
                result = "Sobrepeso"
            } else if imc >= 30 && imc < 40 {
                result = "Obesidade Grau 1"
            } else if imc > 40 {
                result = "Obesidade Grau 2"
            }
            
            self.delegate?.successCalcIMC(value: result)
            
        }
        

    }
    
}
