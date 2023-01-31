//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Thomas Radford on 22/01/2023.
//

import SwiftUI

struct ToDoListView: View {
    
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(toDosVM.toDos) { toDo in
                    
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
                // Short hand cal to onDelete and onMove here
                
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
                
                //Traditiona calls below
                
//                .onDelete { indexSet in
//                    toDosVM.delete(indexSet: indexSet)
//              }
//                .onMove { fromOffsets, toOffset in
//                    toDosVM.move(fromOffsets: fromOffsets, toOffset: toOffset)
//
//                }
            }.navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                .listStyle(.plain)
                .font(.title2)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheetIsPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                }
            
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack{
                        DetailView(toDo: ToDo())
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}


