//
//  ContentView.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
