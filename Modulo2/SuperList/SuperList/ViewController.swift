//
//  ViewController.swift
//  SuperList
//
//  Created by Fabio on 25/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var listTableView: UITableView!
    
    var arrayProdutos:[Produto] =  [Produto(nome: "arroz", preco: "2.00", categoria: .alimento),Produto(nome: "feijao", preco: "5.00", categoria: .alimento),Produto(nome: "farinha", preco: "1.00", categoria: .alimento), Produto(nome: "Leite", preco: "2.50", categoria: .alimento),Produto(nome: "sabao", preco: "2.00", categoria: .limpeza),Produto(nome: "amaciante", preco: "5.00", categoria: .limpeza),Produto(nome: "candida", preco: "1.00", categoria: .limpeza), Produto(nome: "detergente", preco: "2.50", categoria: .limpeza)]
    
    //var arrayProdutos:[String] = ["ProdutoA1","ProdutoA2","ProdutoA3","ProdutoA4","ProdutoA5"]
    //var arrayProdutosLimpeza:[String] = ["ProdutoL1","ProdutoL2","ProdutoL3","ProdutoL4","ProdutoL5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
  //      self.listTableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }


    @IBAction func clicouAddButton(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "addViewController", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: AddViewController? = segue.destination as? AddViewController
        
        vc?.delegate = self
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        var title: String = ""
        
        if section == 0 {
            title = "Alimentos"
        } else {
            title = "Limpeza"
        }
        
        return "section\(title)"
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         
        if section == 0 {
            return self.arrayProdutos.filter({$0.categoria == .alimento}).count
        } else {
            return self.arrayProdutos.filter({$0.categoria == .limpeza}).count
        }
   
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = self.arrayProdutos.filter({$0.categoria == .alimento})[indexPath.row].nome
            cell.detailTextLabel?.text = self.arrayProdutos.filter({$0.categoria == .alimento})[indexPath.row].preco
        }else{
            cell.textLabel?.text = self.arrayProdutos.filter({$0.categoria == .limpeza})[indexPath.row].nome
            cell.detailTextLabel?.text = self.arrayProdutos.filter({$0.categoria == .limpeza})[indexPath.row].preco
        }
        
     
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row) selected")
        let cell:UITableViewCell? = (tableView.cellForRow(at: indexPath) ?? UITableViewCell ()) as UITableViewCell
        //cell?.backgroundColor = UIColor.red
        //cell?.accessoryType = .checkmark
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    }
    
    
}

extension ViewController: AddViewControllerProtocol {
    func successAddProduto(array: [Produto]) {
        
        for value in array {
            print(value)
        }
        
        
        self.arrayProdutos = array
        self.listTableView.reloadData()
        
    }
}
