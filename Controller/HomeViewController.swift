//
//  ViewController.swift
//  Trivia
//
//  Created by Aspire on 20/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DesignClass.roundCornersForButtons(button: nextButton)
        DesignClass.roundCornersForButtons(button: historyButton)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if nameTextField.text == ""{
            displayMessage(userMessage: "Name cannot be empty")
        }
        else{
            goToNextScreen()
        }
        
    }
    
    @IBAction func showHistoryTapped(_ sender: Any) {
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "historyVC") as! HistoryVC
             self.navigationController?.pushViewController(nextView, animated: true)
             
    }
    
    
   //MARK: - function for navigating to next screen
    func goToNextScreen(){
     
        let nextView = self.storyboard?.instantiateViewController(identifier: "CricketerVC") as! CricketerVC
        nextView.name = nameTextField.text!
        nameTextField.text?.removeAll()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    


}

