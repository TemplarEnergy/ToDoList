//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Thomas Radford on 22/01/2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
