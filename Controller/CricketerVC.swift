//
//  cricketerVC.swift
//  Trivia
//
//  Created by Aspire on 20/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import UIKit

class CricketerVC: UIViewController {
    
    @IBOutlet weak var cricketerTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var name = String()
    var answerSelected = String()
    var picker = UIPickerView()
    let options = ["Sachin Tendulkar","Virat Kohli","Adam Gilchirst","Jacques Kallis"]

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        cricketerTextField.inputView = picker
        DesignClass.roundCornersForButtons(button: nextButton)
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    //MARK: - Navigate to next screen
    @IBAction func nextTapped(_ sender: Any) {
        if cricketerTextField.text == "" {
            displayMessage(userMessage: "field cannot be empty")
        }
        else{
            let nextVC = self.storyboard?.instantiateViewController(identifier: "FlagVC") as! FlagVC
            nextVC.cricketer = cricketerTextField.text!
            nextVC.name = name
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    

}

//MARK: - UIPicker Delegate functions
extension CricketerVC : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        options[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cricketerTextField.text = options[row]
        answerSelected = options[row]
    }
    
    
    
}
