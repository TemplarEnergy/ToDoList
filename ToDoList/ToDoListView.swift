//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Thomas Radford on 22/01/2023.
//

import SwiftUI

struct ToDoListView: View {
    
    @State private var sheetIsPresented = false
    
    var ToDos = ["Learn Swift",
                 "Build Apps",
                 "Chane the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(ToDos, id: \.self) { toDo in
                    
                    NavigationLink {
                        DetailView(passedValues: toDo)
                    } label: {
                        Text(toDo)
                    }
                    .font(.title2)
                    
                }
            }.navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .listStyle(.plain)
                .font(.title2)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheetIsPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                    
                }
                .sheet(isPresented: $sheetIsPresented) {
                    DetailView(passedValues: "")
                }
//                .fullScreenCover(isPresented: $sheetIsPresented) {
//                    DetailView(passedValues: "")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


