//
//  DetailViewController.swift
//  List
//
//  Created by Fabio on 25/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var produtoLabel: UILabel!
    @IBOutlet weak var produto2Label: UILabel!
    
    var values: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.produtoLabel.text = values[0]
        self.produto2Label.text = values[1]
     
        print("DetailViewController - viewDidLoad")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicouFechar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DetailViewController - viewWillAppear")
    }
    

    override func viewDidAppear(_ animated: Bool) {
        print("DetailViewController - viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("DetailViewController - viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("DetailViewController - viewWillDisappear")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
