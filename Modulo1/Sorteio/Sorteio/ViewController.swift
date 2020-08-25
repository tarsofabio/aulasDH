//
//  ViewController.swift
//  Sorteio
//
//  Created by Fabio on 24/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit



struct Aluno {
    var name: String
}




class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    
    
    //MARK: GRUPO 1
    @IBOutlet weak var name1G1Label: UILabel!
    @IBOutlet weak var name2G1Label: UILabel!
    @IBOutlet weak var name3G1Label: UILabel!
    @IBOutlet weak var name4G1Label: UILabel!
    @IBOutlet weak var name5G1Label: UILabel!
    
    //MARK: GRUPO 2
    @IBOutlet weak var name1G2Label: UILabel!
    @IBOutlet weak var name2G2Label: UILabel!
    @IBOutlet weak var name3G2Label: UILabel!
    @IBOutlet weak var name4G2Label: UILabel!
    @IBOutlet weak var name5G2Label: UILabel!
    
    //MARK: GRUPO 3
    @IBOutlet weak var name1G3Label: UILabel!
    @IBOutlet weak var name2G3Label: UILabel!
    @IBOutlet weak var name3G3Label: UILabel!
    @IBOutlet weak var name4G3Label: UILabel!
    
    //MARK: Arrays
    
    var arrayTest:[String] = ["Caio Fabrine","Amanda","Fernando","Elder","Harumi","Ghilherme","Oren","Gilmar","Fabio Tarso","Mauro","Clayton","Daniel","Rafael","Vitor"]
    
    var arrayNomes:[Aluno] = []
    var arrayG1:[Aluno] = []
    var arrayG2:[Aluno] = []
    var arrayG3:[Aluno] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        
        for value in self.arrayTest {
            
            self.arrayNomes.append(Aluno(name: value))
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedSortButton(_ sender: UIButton) {
        
        //        var temp = arc4random() % 14
        //        print(temp)
        
        
        
        
        for _ in self.arrayNomes {
            
            
            let name: Aluno? = self.arrayNomes.randomElement()
            
            guard let _name = name else{return}
            print("====sorteio====")
            print(_name.name)
            
            self.arrayNomes = self.arrayNomes.filter({$0.name != _name.name  })
            
            print(self.arrayNomes)
            

            if self.arrayG1.count < 5 {
                
                self.arrayG1.append(_name)
                
            }else if self.arrayG2.count < 5 {
                
                self.name1G1Label.text = self.arrayG1[0].name
                self.name2G1Label.text = self.arrayG1[1].name
                self.name3G1Label.text = self.arrayG1[2].name
                self.name4G1Label.text = self.arrayG1[3].name
                self.name5G1Label.text = self.arrayG1[4].name
                
                self.arrayG2.append(_name)
                
            }else if self.arrayG3.count < 4 {
                self.name1G2Label.text = self.arrayG2[0].name
                self.name2G2Label.text = self.arrayG2[1].name
                self.name3G2Label.text = self.arrayG2[2].name
                self.name4G2Label.text = self.arrayG2[3].name
                self.name5G2Label.text = self.arrayG2[4].name
                
                self.arrayG3.append( _name)
                
         
            }
            
           
        }

        self.name1G3Label.text = self.arrayG3[0].name
        self.name2G3Label.text = self.arrayG3[1].name
        self.name3G3Label.text = self.arrayG3[2].name
        self.name4G3Label.text = self.arrayG3[3].name
        
        self.arrayNomes.removeAll()
        self.arrayG3.removeAll()
        self.arrayG2.removeAll()
        self.arrayG1.removeAll()
                
        
        for value in self.arrayTest {
            self.arrayNomes.append(Aluno(name: value))
        }
        
        print(self.arrayNomes.count)
        
    }
}


extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if self.arrayNomes.count < 14 {
            self.arrayNomes.append(Aluno(name: textField.text  ?? "") )
            textField.text = nil
        }
        
        print (self.arrayNomes)
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.arrayNomes.count < 14 {
            self.arrayNomes.append(Aluno(name: textField.text  ?? "") )
            textField.text = nil
        }
        
        print (self.arrayNomes)
        
        
    }
    
    
    
}
