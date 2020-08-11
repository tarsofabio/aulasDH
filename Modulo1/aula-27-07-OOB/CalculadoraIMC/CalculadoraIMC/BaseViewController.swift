//
//  BaseViewController.swift
//  CalculadoraIMC
//
//  Created by Fabio on 10/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()    
    }
    
    func setupView() {
        self.view.backgroundColor = .gray
    }

}
