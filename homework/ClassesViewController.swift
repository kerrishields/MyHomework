//
//  ClassesViewController.swift
//  homework
//
//  Created by Kerri Shields on 4/21/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addClassButton: UIBarButtonItem!
    
    var classItem: String?
    
   
    var classesArray = [String]()
    
    let defaultsData = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
    }
    
    func saveUserDefaults() {
        let classesDefaultsArray = classesArray
        let classesData = NSKeyedArchiver.archivedData(withRootObject: classesDefaultsArray)
        UserDefaults.standard.set(classesData, forKey: "savedClasses")
        print("help")
    }
    
    @IBAction func addClassPressed(_ sender: UIBarButtonItem) {
        
        
        
    }
    
    
    
    @IBAction func unwindToViewController(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClassesViewController, let classC = sourceViewController.classItem
           
        {
            
            
            classesArray.append(classC)
            saveUserDefaults()
    
    
    
        }}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
        func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return classesArray.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "classesCell", for: indexPath)
            cell.textLabel?.text = classesArray[indexPath.row]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true}
        
        
        // Override to support editing the table view.
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                classesArray.remove(at: indexPath.row) // remove from array
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
            // If a change was made, re-save your data.  This saves ALL of your data
            // but since we won't have too many classes items, this should be fine.
            defaultsData.set(classesArray, forKey: "classesArray")
            
        }
        // Override to support rearranging the table view.
        func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            // First copy the elements you're moving using the "from" location
            let itemToMove = classesArray[fromIndexPath.row]
            
            // Delete the elements at the "from" location, pre-move
            classesArray.remove(at: fromIndexPath.row)
            
            // Now insert the elements at the "to", post-move location
            classesArray.insert(itemToMove, at: to.row)
            
            // Save to UserDefaults
            defaultsData.set(classesArray, forKey: "classesArray")
            
        }
        
        // Override to support conditional rearranging of the table view.
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the item to be re-orderable.
            return true
        }
        
        
        override func setEditing(_ editing: Bool, animated: Bool) {
            super.setEditing(editing, animated: animated)
            if editing {
                addClassButton.isEnabled = false
            } else {
                addClassButton.isEnabled = true
            }
        }
    
    @IBAction func unwindToClassesemptyViewController(sender: UIStoryboardSegue) {}
    
    
    @IBAction func unwindToClassesViewController(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddClassViewController, let classC = sourceViewController.classField.text
        {
            

              classesArray.append(classC)
            tableView.reloadData()
            saveUserDefaults()
            
           
        }
    }
    
    
    
    
   
            
    

    
}

