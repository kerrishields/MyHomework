//
//  AddClassViewController.swift
//  homework
//
//  Created by Kerri Shields on 4/24/17.
//  Copyright © 2017 Kerri Shields. All rights reserved.
//

import UIKit

class AddClassViewController: UIViewController {

    
   
    
    @IBOutlet weak var classField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var classItem: String?
    
    var newClass: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classField.text = classItem
       
//        classField.delegate = self
        classField.becomeFirstResponder()
    
        //save button problem!
        
        if classItem?.characters.count == 0
            //|| classItem == nil
        {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
            navigationItem.title = "Add Class"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    //MARK:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // if this was called b/c the user is typing in the toDoField
        if textField == classField {
            // grab text before the typing
            let oldString = textField.text! as NSString
            // find out what the newString will look like after typing
            let newString = oldString.replacingCharacters(in: range, with: string) as NSString
            // if, after the typing, the new String has nothing in it, then disable the save button
            if newString.length == 0 {
                saveButton.isEnabled = false
            } else {
                saveButton.isEnabled = true
            }
        }
        return true
    }
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton == sender as! UIBarButtonItem {
            classItem = classField.text
            
        }
    }
    


    
    
    
    
}
