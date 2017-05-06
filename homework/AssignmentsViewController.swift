//
//  AssignmentsViewController.swift
//  homework
//
//  Created by Kerri Shields on 4/23/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController {

   @IBOutlet weak var userInput: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var classesArray: [String] = []
    
    
    var chooseClass = ""
    var descriptionX = ""
    var dueDate: Date!
    
   
    
     var infoArray: [infoStruct] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pickerView.delegate = self
       
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        
        // If you look at the storyboard you'll see the "modal/add" segue comes through the navigation controller, while the "show/edit-row" segue comes directly from the table view controller.
        let isPresentingInAddMode = presentingViewController is UINavigationController
        // If we're coming from the navigation controller, then we're presenting in "Add" mode using a "Modal" segue.
        if isPresentingInAddMode {
            // Modal segues need to be dismissed
            dismiss(animated: true, completion: nil)
        } else {
            // But Show segues are "popped" off of a stack of controllers.
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    

    
    
    
}


 
    
    extension AssignmentsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return classesArray.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return classesArray[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
           
        }
        
   
       
        

    }
    
    
    
    
    
    
    
    
    
    
    
//
//

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

//
//    
//    
//    
//    @IBAction func unwindToAssignmentsViewController(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.source as? AssignmentsViewController, let classesItem = sourceViewController.classesItem {
//            
//            // if the user clicked a table view row to get to detail (there wouldn't be an .indexPathForSelectedRow if we clicked the "+" button)
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                // Update our array with the updated information from classesItem we got from the source, above
//                classesArray[selectedIndexPath.row] = classesItem
//                
//                
//                // Update the tableView cell with this new classesItem, too (the at: takes an array of rows, but we're only passing a single row, so the brackets mean it's a single-element array). ".none" means no animation.
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            } else { // else, there wasn't a selected row, so we must be adding a row/cell and array element
//                // Add the new classesItem from the DetailViewController to the classesArray
//                classesArray.append(classesItem)
//                
//                // Add a new item to the array and the table view
//                // Create an IndexPath at the end of the table view
//                let newIndexPath = IndexPath(row: classesArray.count - 1, section: 0)
//                // Insert this newIndexPath into the table view.
//                tableView.insertRows(at: [newIndexPath], with: .bottom)
//                // After we insert the new table view row (creating a new cell), the tableView "cellForRowAt" function above will trigger automatically to fill in data for the new cell.  We don't see this call to tableView "cellForRowAt" anywhere, but iOS is paying attention and will send an event that triggers this function whenever we need to update what's inside a cell.
//            }
//            defaultsData.set(classesArray, forKey: "classesArray")
//            
//        }
//
//    
//    
//    
//    
//    
//    
//    
//    
//    // MARK:- Delegates & DataSources, Required Methods for UIPickerView
//    
//    // A required UIPickerView function. Sets our picker so that it has only one column (component).
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    // Required UIPickerView function, sets up the pickerView so that it has as many rows as we have
//    // elements in our formulasArray (which is our datasource for the pickerView).
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return classesArray.count
//    }
//    
//    // Required UIPickerView function that uses formulasArray as a datasource to populate the rows
//    // of the pickerView.
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return classesArray[row].conversionString
//    }
//    
//    // This function is called whenever the user selects a row in the UIPickerView.
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // row is a local cosntant passed in above, but we save it to the class-wide property
//        // rowSelected so that we can access the selected row in other functions.
//        rowSelected = row
//        // Also set the property conversionString as the text from the row selected.
//        // We'll access this in other functions, too.
//        conversionString = classesArray[row].conversionString
//        // Set up the text we'll use for fromUnitsLabel and resultsLabel
//        assignUnits()
//        
//        
//        // If we don't have an empty userInput field, then perform a conversion calculation.  If we didn't
//        // do this check, then we'd get a showAlert error whenever we moved the formulaPicker with nothing in
//        // userInput.text, since Double("") would return nil and not a Double.
//        if userInput.text?.characters.count != 0 {
//            //save?
//        }
//    }
//    
//
//    
//    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
//    }
//    
//    
//    
//    
//    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
//    }
//    
//    
//    
//    

