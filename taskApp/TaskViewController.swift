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
    
    let defaultItem = ListItem(taskTitle: "Task", priority: .high, daysToComplete: 5)
    var taskArray: [ListItem] = []
    var delegate: UpdateTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }

    @IBAction func addItem(_ sender: Any) {
        self.delegate!.addItem(ListItem(taskTitle: "Task", priority: .high, daysToComplete: 2))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
            cell.textLabel?.text = taskArray.isEmpty ? "" : taskArray[indexPath.row].taskTitle
        
            return cell
    }
}

