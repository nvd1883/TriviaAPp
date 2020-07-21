//
//  FlagVC.swift
//  Trivia
//
//  Created by Aspire on 20/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import UIKit

class FlagVC: UIViewController {
    
    @IBOutlet weak var optionsTable: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var name = String()
    var cricketer = String()
    var options = ["White","Yellow","Orange","Green"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectArray = [String]()
     var joinedArray = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTable.delegate = self
        optionsTable.dataSource = self
        self.optionsTable.isEditing = true
           self.optionsTable.allowsMultipleSelectionDuringEditing = true
        DesignClass.roundCornersForButtons(button: nextButton)

        // Do any additional setup after loading the view.
    }
    
    //MARK:- function to get the current time
    func getCurrenttime() -> String{
        let calendar = Calendar.current
        let date = Date()
        let dateComponents = calendar.component(.day, from: date)
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .ordinal
        
        let day = numberFormatter.string(from: dateComponents as NSNumber)
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM,h:mm a"
        
        let dateString = "\(day!) \(dateFormatter.string(from: date))"
        
        return dateString
    }
    
        func selectDeselectCell(tableView:UITableView,indexPath:IndexPath){
            self.selectArray.removeAll()
            if let arr = tableView.indexPathsForSelectedRows{
                for index in arr{
                    selectArray.append(options[index.row])
                }
            }
            joinedArray = selectArray.joined(separator: ",")
           
    }
    
    //MARK:- saving to coredata functionality
    
    func saveSelection(){
        do{
            try context.save()
        }
        catch{
            print("Error saving context \(error)")
        }
    }
    
    //MARK: - function to navigate to next screen
    
    func goToNextView(){
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "summaryVC") as! SummaryVC
        nextView.name = self.name
        nextView.cricketerName = self.cricketer
        nextView.flagColours = self.joinedArray
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    //MARK: - saving the responses to coredata while navigating to next screen
    @IBAction func nextButtonTapped(_ sender: Any) {
        if joinedArray == "" {
            displayMessage(userMessage: "Please select atleast one option")
        }
        else{
            let response = Response(context: context)
            response.flag = joinedArray
            response.cricketer = cricketer
            response.name = name
            response.currentDate = self.getCurrenttime()
            saveSelection()
            goToNextView()
            
        }
        
    }
    


}

extension FlagVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = optionsTable.dequeueReusableCell(withIdentifier: "responseCell")!
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDeselectCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectDeselectCell(tableView: tableView, indexPath: indexPath)
    }
    
    
    
    
}
