//
//  ViewController.swift
//  homework
//
//  Created by Kerri Shields on 4/18/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var classesArray = [String]()
    var classItem: String?
    
      var infoArray: [infoStruct] = []
    var todayArray: [infoStruct] = []
    var notTodayArray: [infoStruct] = []
    var test: Array<Array<infoStruct>> = []
    
    
    @IBOutlet weak var thisWeekTV: UITableView!
    
    
    
    
    override func viewDidLoad() {
        thisWeekTV.delegate = self
        thisWeekTV.dataSource = self
        loadClasses()
        loadAssignments()
       
    }
    
    
    //put unwind for done button here
    
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClassesViewController {
             self.classesArray = sourceViewController.classesArray
            print(self.classesArray)
            
         
            
        }
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "ToAddAssignment" {
           let destinationViewController = segue.destination as! AssignmentsViewController
            destinationViewController.classesArray = classesArray
            
        } else if segue.identifier == "ToAddClass" {
            let destinationViewController = segue.destination as! ClassesViewController
            destinationViewController.classesArray = classesArray
        }
    }
    
    func checkDates(info: [infoStruct]) {
        
    }
    
    func loadClasses() {
        if let classesDefaultData = UserDefaults.standard.object(forKey: "savedClasses") as? Data {
             let classesDefaultsArray = NSKeyedUnarchiver.unarchiveObject(with: classesDefaultData) as! [String]
                self.classesArray = classesDefaultsArray
            print("****hi")
           
            
        } else {
            print("error loading data")
            
        }

    }
    
    func saveAssignments() {
        let classesDefaultsArray = todayArray
        let classesData = NSKeyedArchiver.archivedData(withRootObject: classesDefaultsArray)
        UserDefaults.standard.set(classesData, forKey: "todayAssignments")
        print("help")
        let classesDefaultsArray2 = notTodayArray
        let classesData2 = NSKeyedArchiver.archivedData(withRootObject: classesDefaultsArray2)
        UserDefaults.standard.set(classesData2, forKey: "notTodayAssignments")
    }
    
    
    
    func loadAssignments() {
        if let classesDefaultData = UserDefaults.standard.object(forKey: "todayAssignments") as? Data {
            let classesDefaultsArray = NSKeyedUnarchiver.unarchiveObject(with: classesDefaultData) as! [infoStruct]
            self.todayArray = classesDefaultsArray
            print("****hi")
            
            
        } else {
            print("error loading data")
            
        }
        if let classesDefaultData = UserDefaults.standard.object(forKey: "notTodayAssignments") as? Data {
            let classesDefaultsArray = NSKeyedUnarchiver.unarchiveObject(with: classesDefaultData) as! [infoStruct]
            self.notTodayArray = classesDefaultsArray
            print("****hi")
            
            
        } else {
            print("error loading data")
        }
    
            self.test.append(self.todayArray)
        self.test.append(self.notTodayArray)
    }
    
    
    
    
    @IBAction func unwindToViewController2(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AssignmentsViewController
        {
            let info1 = sourceViewController.userInput.text!
            print(info1)
         let info2 = sourceViewController.pickerView.selectedRow(inComponent: 0)
            let info3 = sourceViewController.datePicker.date
            let temp = infoStruct(name: classesArray[info2], description: info1, dueDate: info3)
         
            let date = Date()
            print(date)
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            
            let day2 = calendar.component(.day, from: info3)
            let month2 = calendar.component(.month, from: info3)
      
            
            
            if day == day2 && month == month2 {
             checkDates(info: todayArray)
            todayArray.append(temp)
                
                
                print(todayArray)
                print(notTodayArray)
                print(test)
                
        } else {
             checkDates(info: notTodayArray)
                notTodayArray.append(temp)
        }
        test.removeAll()
            
            todayArray = todayArray.sorted(by: {$0.dueDate < $1.dueDate})
            notTodayArray = notTodayArray.sorted(by: {$0.dueDate < $1.dueDate})
            test.append(todayArray)
            test.append(notTodayArray)
            
            saveAssignments()
            
            
        
          thisWeekTV.reloadData()
            
            
            
        }
    }
    
}

    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       print(tableView)
        return test.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
       return test[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellThisWeek", for: indexPath) as! assignTableViewCell
      
        cell.className.text = test[indexPath.section][indexPath.row].chooseClass
        cell.classDescrip.text = test[indexPath.section][indexPath.row].dsc
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM / dd"
        
        
        cell.classDate.text = formatter.string(from: test[indexPath.section][indexPath.row].dueDate)
        print("hello")

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Due Today!"
        } else {
            return "Upcoming!"
        }
    }
    
}



