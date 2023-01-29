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
    
}
