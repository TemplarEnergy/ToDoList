//
//  DetailView.swift
//  ToDoList
//
//  Created by Thomas Radford on 22/01/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var toDo = ""
    @State private var notes = ""
    @State private var dueDate   = Date.now + (60*60*24)
    @State private var reminderIsOn = false
    @State private var isCompleted = false
    
    var passedValues: String
    
    var body: some View {
        NavigationStack{
            
            List {
                TextField("Enter to Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder:", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOn)
                Text("Notes:")
                    .padding(.top)
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                Toggle("Completed:", isOn: $isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing ) {
                    Button("Save") {
                        //TODO: add save code here()
                    }
                }
            }.navigationBarBackButtonHidden()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValues: "Item 1")    }
}
