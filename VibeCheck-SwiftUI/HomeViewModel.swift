//
//  HomeViewModel.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import Foundation
import SwiftUI
import CoreData

class HomeViewModel : ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
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
        
        let newTask = CheckIn(context: context)
        newTask.date = date
        newTask.content = content
        
        do{
            try context.save()
            isNewData.toggle()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
}
