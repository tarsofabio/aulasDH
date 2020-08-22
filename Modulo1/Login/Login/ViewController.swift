//
//  ViewController.swift
//  Login
//
//  Created by Fabio on 22/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


class Usuario {
    
    
    var email: String?
    var password: String?
    
    
    init(email: String?, password: String?) {
        
        self.email = email
        self.password = password
    }
    
    
    init() {
        self.email = nil
        self.password = nil
    }
    
}



class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
 //   var usuario: Usuario = Usuario (email: nil, password: nil)
    
 //   var usuario: Usuario?
    
    var usuario: Usuario = Usuario()
    
    func enableButton(value: Bool) {
        
        if value {
            self.cadastrarButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
            self.loginButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
  
        } else {
            self.cadastrarButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
            self.loginButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
        }
        
        self.loginButton.isEnabled = value
        self.cadastrarButton.isEnabled = value
        
    }
    
    
    func clearFields() {
        
        self.emailTextField.text = nil
        self.passwordTextField.text = nil
        
        }
    
    
    func checkIsValidFields() -> Bool {
        
//        if !(self.emailTextField.text?.isEmpty ?? false) && !(self.passwordTextField.text?.isEmpty ?? false) {
//            self.enableButton(value: true)
//            return true
//        }
        

        if !(self.usuario.email?.isEmpty ?? true) && !(self.usuario.password?.isEmpty ?? true) {
            self.enableButton(value: true)
            return true
        }
        self.enableButton(value: false)
        return false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enableButton(value: false)
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordTextField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }


    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        if self.emailTextField.text == usuario.email && self.passwordTextField.text == usuario.password {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
        
        
        print("tappedLoginButton")
    }
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        print("tappedCadastrarButton")
        
        if self.checkIsValidFields() {
            self.clearFields()
        }
        
    }
}



extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        }else{
            self.passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.emailTextField {
            self.usuario.email = textField.text
        } else {
            self.usuario.password = textField.text
        }
        
        print(self.usuario.email)
        print(self.usuario.password)
        
        let _ = self.checkIsValidFields()
        
//        if !self.checkIsValidFields() {
//            self.enableButton(value: self.checkIsValidFields())
//        } else {
//            self.enableButton(value: self.checkIsValidFields())
//        }
        
        
    }
}
