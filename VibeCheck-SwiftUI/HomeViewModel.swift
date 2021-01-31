//
//  HomeViewModel.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class HomeViewModel : ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    
    
    @Published var isNewData = false
    
    
    @Published var updateItem : CheckIn!
    
    
    let calendar = Calendar.current
    
    func checkDate() -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date){
            return "Tomorrow"
        } else {
            return "Other Day"
        }
    }
    func updateDate(value: String) {
        
        if value == "Today"{date = Date()}
        else if value == "Tomorrow"{
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        }
        else {
            print("NEXT")
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        

            print("making new note")
        let newTask = CheckIn(context: context)
        newTask.date = date
        newTask.content = content
        
        do{
            try context.save()
            isNewData.toggle()
            print(isNewData)
            content = ""
            date = Date() 
        }
        catch {
            print(error.localizedDescription)
         
        }
       
        
    }
    
    func editItem(context: NSManagedObjectContext) {
      
        let updateTask = CheckIn(context: context)
        updateTask.date = date
        content = checkIn.content!
        print(updateItem.content)
        
        if updateItem != nil {
            print("!= nil")
            updateItem.date = date
            updateItem.content = content
            print("before save")
            writeData(context: updateItem)
            
            print("updated")
            updateItem = nil
            print("update2\(updateItem.content)")
            isNewData.toggle()

            print("isNewData")
            content = ""
            date = Date()
            print("before return\(isNewData)")
            return
        }
    
        isNewData.toggle()
    }
    
}
