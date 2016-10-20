//
//  FirstViewController.swift
//  ToDoList1
//
//  Created by Elizabeth Lee on 10/19/16.
//  Copyright © 2016 Elizabeth Lee. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var tasks:[Task] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let task = TaskManager.sharedInstance.taskAtIndex(index: indexPath.row)
        cell.textLabel?.text = task.name
        if task.completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    override func viewDidLoad() { //not called each switch
        super.viewDidLoad()
        
        let count = TaskManager.sharedInstance.count
        print("Todo Count: \(count)")
        
        let t = TaskManager.sharedInstance.taskAtIndex(index: 0)
        print("First Task: \(t.name)")
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            TaskManager.sharedInstance.tasks.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(tasks, forKey:"items")
        }
    }
    
    func setCheckMark(cell: UITableViewCell, completed: Bool) {
        if completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = TaskManager.sharedInstance.taskAtIndex(index: indexPath.row)
        task.completed = !task.completed
        let cell = tableView.cellForRow(at: indexPath)!
        setCheckMark(cell: cell, completed: task.completed)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

