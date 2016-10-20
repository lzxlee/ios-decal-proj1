//
//  TaskManager.swift
//  ToDoListAppFinal
//
//  Created by Elizabeth Lee on 10/19/16.
//  Copyright © 2016 Elizabeth Lee. All rights reserved.
//

import UIKit

class TaskManager {
    static let sharedInstance = TaskManager()
    
    var tasks = [Task]()
    
    var count: Int {
        get {
            return tasks.count
        }
    }
    
    func taskAtIndex(index: Int) -> Task {
        return tasks[index]
    }
    
    func addNewTaskWithName(name: String) {
        let task = Task(name: name)
        tasks.append(task)
        
    }
    
    func removeTask(name:String) {
        
    }
    
    private init() {
        tasks.append(Task(name: "get dressed"))
        let t = Task(name: "Sleep")
        t.completed = true
        tasks.append(t)
        //tasks = []

    }
}
