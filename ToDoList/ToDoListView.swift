//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Thomas Radford on 22/01/2023.
//

import SwiftUI

struct ToDoListView: View {
    
    var ToDos = ["Learn Swift",
                 "Build Apps",
                 "Chane the World",
                 "Bring the Awesome"]
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(ToDos, id: \.self) { toDo in
                    
                    NavigationLink {
                        DetailView(passedValues: toDo)
                    } label: {
                        Text(toDo)
                    }
                    
                }
            }.navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


