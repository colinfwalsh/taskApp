//
//  ViewController.swift
//  taskApp
//
//  Created by Colin Walsh on 11/3/17.
//  Copyright © 2017 Colin Walsh. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskModelArray: [ListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let listItem = ListModel(task: "Task", priority: .high, daysToComplete: 5)
        
        for _ in 0..<15 {
//            taskModelArray.append(listItem)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModelArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            taskModelArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch taskModelArray.isEmpty {
        case false:
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
            cell.textLabel?.text = taskModelArray[indexPath.row].task
        
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "listEmpty", for: indexPath)
            
            cell.textLabel?.text = "No Tasks"
            
            return cell
        }
    }
}

