//
//  SummaryVC.swift
//  Trivia
//
//  Created by Aspire on 20/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {
    
    var name = String()
    var cricketerName = String()
    var flagColours = String()
    @IBOutlet weak var bestCricketerLabel: UILabel!
    @IBOutlet weak var flagColourLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Hello \(name)"
        bestCricketerLabel.text = cricketerName
        flagColourLabel.text = flagColours
        
        //MARK: - make the corners of the button round
        DesignClass.roundCornersForButtons(button: finishButton)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
          self.navigationController!.popToViewController(viewControllers[viewControllers.count - 4], animated: true)
    }
    
    


}
