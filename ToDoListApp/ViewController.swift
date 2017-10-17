//
//  ViewController.swift
//  ToDoListApp
//
//  Created by iMac03 on 2017-10-16.
//  Copyright © 2017 iMac03. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var item : Item? = Item(name:"")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            nameTextField.text = item.name
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    // Gets called when Cancel button is pressed
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        /* Creates boolean balue that indicates whether the view controller presenting
           this scene is of type UINavigationController. This means the 'add button was
           used to present the scene. This is because the scene is embedded in its own
           navigation controller, meaning that the navigation controller presents it.
 
         */
        let isInAddMode = presentingViewController is UINavigationController
        
        if isInAddMode {
            // Returns from add mode back to table
            // segue "AddItem" to "Navigation Controller"
            dismiss(animated: true, completion: nil)
            
        } else {
            // Returns from edit mode (edit mode is connected to
            // segue "ShowDetail" to "Item"
            navigationController!.popViewController(animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as AnyObject {
            let name = nameTextField.text ?? ""
            item = Item(name:name)
        }
    }
    


}

