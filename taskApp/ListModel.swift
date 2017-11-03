//
//  ListModel.swift
//  taskApp
//
//  Created by Colin Walsh on 11/3/17.
//  Copyright © 2017 Colin Walsh. All rights reserved.
//

import Foundation

enum Priority {
    case high
    case medium
    case low
}

struct ListCategory {
    let title: String
    let taskArray: [ListItem] = []
    var numberOfItems: Int {
        return taskArray.count
    }
}

struct ListItem {
    let taskTitle: String
    let priority: Priority
    let daysToComplete: Int
    let isCompleted: Bool = false
}
