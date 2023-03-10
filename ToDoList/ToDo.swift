//
//  ToDo.swift
//  ToDoList
//
//  Created by Thomas Radford on 29/01/2023.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item = ""
    var notes = ""
    var dueDate   = Date.now + (60*60*24)
    var reminderIsOn = false
    var isCompleted = false
}
