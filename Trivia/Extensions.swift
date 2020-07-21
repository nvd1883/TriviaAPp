

import UIKit
extension UIViewController {
    
    //MARK: - function to hide keyboard when tapped around
    
    func hideKeyboardWhenTappedAround(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }
    
}

