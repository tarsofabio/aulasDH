//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Fabio on 10/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class CalculadoraVC: BaseViewController {

    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var calcView: CalculadoraView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calcButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //self.setupView()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func clicouCalcularButton(_ sender: UIButton) {
        
        self.resultadoLabel.text = self.calcView.calcularIMC()
        
    }
    
    override func setupView() {
        self.calcView.setupView(color: .gray)
        self.view.backgroundColor = .green
        self.containerView.backgroundColor = .green
        self.calcButton.backgroundColor = .red
        self.calcButton.setTitleColor(.white, for: .normal)
    }
    
}

