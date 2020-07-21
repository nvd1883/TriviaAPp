//
//  HistoryVC.swift
//  Trivia
//
//  Created by Aspire on 21/07/20.
//  Copyright © 2020 Aspire. All rights reserved.
//

import UIKit
import CoreData

class HistoryVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var historyCV: UICollectionView!
    var historyArray = [Response]()
        var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
 
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }
    
 //MARK: - collectionview delegate functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyArray.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.historyCV.dequeueReusableCell(withReuseIdentifier: "historyCell", for: indexPath) as! HistoryCell
        if let name = historyArray[indexPath.row].name {
                   cell.nameLabel.text = "Name: \(name)"
               }
        cell.cricketerLabel.text = historyArray[indexPath.row].cricketer
        cell.flagColourLabel.text = historyArray[indexPath.row].flag
               if let currentDate = historyArray[indexPath.row].currentDate {
                cell.gameCountLabel.text = "GAME \(indexPath.row + 1): \(currentDate)"
               }

               return cell
     }
    
    
    //MARK: - function to load items from coredata
       
       func loadData(){
           let request: NSFetchRequest<Response> = Response.fetchRequest()
           do{
               historyArray = try context.fetch(request)
           }
           catch{
              print("Error \(error)")
           }
       }

    


}
