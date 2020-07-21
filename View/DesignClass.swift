
import Foundation
import UIKit

class DesignClass {
    
    class func roundCornersForButtons(button : UIButton){
        
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    class func roundCornersforTextField(textField:UITextField){
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 15.0
        textField.clipsToBounds = true
        
    }
    
}
