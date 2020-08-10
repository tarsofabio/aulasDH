//
//  CalculadoraView.swift
//  CalculadoraIMC
//
//  Created by Fabio on 10/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit
import Foundation

class CalculadoraView: UIView {
    
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!

    
    func setupView() {
        
        self.alturaTextField.placeholder = "Altura"
        self.pesoTextField.placeholder  = "Peso"
        
    }
    
    
    func calcularIMC() -> String{
                
           
                let height: Float = Float(self.alturaTextField.text ?? "" ) ?? 0
                let weight: Float = Float(self.pesoTextField.text ?? "" ) ?? 0

                
                let height2 = height * height
                
                let imc = weight/height2
                
                if imc < 16 {
                    return "Abaixo do peso"
                } else if imc >= 19 && imc < 25 {
                    return "Peso normal"
                } else if imc >= 25 && imc < 30 {
                    return "Sobrepeso"
                } else if imc >= 30 && imc < 40 {
                    return "Obesidade Grau 1"
                } else if imc > 40 {
                    return "Obesidade Grau 2"
                }
                
                return "Não conseguimos calcular"
            }
            
        }
