//
//  SecondViewController.swift
//  ToDoList1
//
//  Created by Elizabeth Lee on 10/19/16.
//  Copyright © 2016 Elizabeth Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    //nameText
    @IBOutlet weak var itemTextField: UITextField!
    
    //saveButtonTapped
    @IBAction func add(_ sender: AnyObject) {
        if (itemTextField.text! != "") {
            TaskManager.sharedInstance.addNewTaskWithName(name: itemTextField.text!)
        }

        itemTextField.text = ""
        dismiss(animated: true)
    }

    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

