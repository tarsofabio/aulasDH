//
//  ViewController.swift
//  List
//
//  Created by Fabio on 25/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segueIdentifier: String = "produtoDetail"

    @IBOutlet weak var produtoTextField: UITextField!
    @IBOutlet weak var produto2TextField: UITextField!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    
    override func viewDidLoad() {
        
        print("ViewController - viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
  
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController - viewWillAppear")
    }
    

    override func viewDidAppear(_ animated: Bool) {
        print("ViewController - viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController - viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController - viewWillDisappear")
    }
    
        
    
    @IBAction func clicouCadastrar(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.segueIdentifier, sender: self.produtoTextField.text)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let produto: String? = sender as? String
        
        var vc: DetailViewController? = segue.destination as? DetailViewController
        
        vc?.values.append( self.produtoTextField.text ?? "")
        vc?.values.append( self.produto2TextField.text ?? "")
        
  //      self.present(vc ?? UIViewController(), animated: true, completion: nil)
        
    }
    
}

