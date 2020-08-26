//
//  AddViewController.swift
//  SuperList
//
//  Created by Fabio on 25/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit





protocol AddViewControllerProtocol: class {
    
    func successAddProduto(array: [Produto])
    
}


class AddViewController: UIViewController {

    @IBOutlet weak var produtoTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    weak var delegate: AddViewControllerProtocol?
    
    private var arrayProdutos: [Produto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cadastrarButton.isEnabled = false
        self.produtoTextField.delegate = self
        self.precoTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        print("tappedCadastrarButton")
        
        self.arrayProdutos.append(Produto(nome: self.produtoTextField.text ?? "", preco: self.precoTextField.text ?? "", categoria: .limpeza))
        
        print(arrayProdutos)
        
        self.produtoTextField.text = nil
        self.precoTextField.text = nil
        self.cadastrarButton.isEnabled = false
        
        self.delegate?.successAddProduto(array: self.arrayProdutos)
        
    }
    
}


extension AddViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        let produto = self.produtoTextField.text?.isEmpty ?? true
        let preco = self.precoTextField.text?.isEmpty ?? true
        
        
        if !produto && !preco {
            self.cadastrarButton.isEnabled  = true
        }else{
            self.cadastrarButton.isEnabled = false
        }
    }
}
