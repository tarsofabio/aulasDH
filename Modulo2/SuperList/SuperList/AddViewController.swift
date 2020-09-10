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
    
    @IBOutlet weak var produtosTableView: UITableView!
    @IBOutlet weak var categoriaSegmented: UISegmentedControl!
    
    weak var delegate: AddViewControllerProtocol?
    
    private var arrayProdutos: [Produto] = []
    private var categoriaSelected: Categoria = .limpeza
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cadastrarButton.isEnabled = false
        self.produtoTextField.delegate = self
        self.precoTextField.delegate = self
        
        self.produtosTableView.delegate = self
        self.produtosTableView.dataSource = self
        self.categoriaSegmented.selectedSegmentIndex = -1
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedCategoriaButton(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.categoriaSelected = .alimento
        }else{
            self.categoriaSelected = .limpeza
        }
        
        self.produtoTextField.resignFirstResponder()
        self.precoTextField.resignFirstResponder()
        
        print(self.categoriaSelected)
        print(sender.selectedSegmentIndex)
    }
    
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        print("tappedCadastrarButton")
        
        self.arrayProdutos.append(Produto(nome: self.produtoTextField.text ?? "", preco: self.precoTextField.text ?? "", categoria: .limpeza))
        
        print(arrayProdutos)
        
        self.produtoTextField.text = nil
        self.precoTextField.text = nil
        self.cadastrarButton.isEnabled = false
        
        self.produtosTableView.reloadData()
        
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


extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayProdutos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.arrayProdutos[indexPath.row].nome
        cell.detailTextLabel?.text = self.arrayProdutos[indexPath.row].preco
        
        return cell
    }
    
    
    
}

