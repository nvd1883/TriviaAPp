//
//  Displaymessage.swift
//  Trivia
//
//  Created by Aspire on 20/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{

func displayMessage(userMessage:String) -> Void {
    
    DispatchQueue.main.async
        {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped")
                DispatchQueue.main.async
                    {
                        
                        alertController.dismiss(animated: true, completion: nil)
                        
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
    }
}
}
