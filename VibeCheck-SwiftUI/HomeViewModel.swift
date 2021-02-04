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
        
        if  updateItem != nil {
            updateItem.date = date
            updateItem.content = content
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            return
        }
   
        let newTask = CheckIn(context: context)
        newTask.date = date
        newTask.content = content
      
        
        do{
            try context.save()
            isNewData.toggle()
            content = ""
            date = Date()

        }
        catch {
            print(error.localizedDescription)
         
        }
    }
    
        func editItem(Item: CheckIn) {
      
            updateItem = Item
            date = Item.date!
            content = Item.content!
            
       
          
            isNewData.toggle()

        }
    
}
