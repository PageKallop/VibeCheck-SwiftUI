//
//  HomeViewModel.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false 
    
}
