//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Thomas Radford on 29/01/2023.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init(){
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World"))
    }
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        // If new append to toDOVM.todos else update the toDo that was pased in from the List
        if newToDo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}){
                toDos[index] = toDo
            }
        }
    }
    func delete(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)

    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
