//
//  HomeView.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
       
        Button(action: {homeVM.isNewData.toggle()}) {
            Text("Button")
        }
        .sheet(isPresented: $homeVM.isNewData, content: {
            NewDataView(homeData: HomeViewModel())
        })
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
