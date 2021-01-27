//
//  DateButtonView.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import SwiftUI

struct DateButtonView: View {
  
    
   
    var title: String

    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        Button(action: {}, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    LinearGradient(gradient: .init(colors: [Color(.cyan), Color(.black)]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
       

    }
}

struct DateButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DateButtonView(title: "Hello", homeData: HomeViewModel())
    }
}
