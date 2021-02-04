//
//  NewDataView.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import SwiftUI
import CoreData
import Combine

struct NewDataView: View {
    

    @ObservedObject var homeData : HomeViewModel
  
    @Environment(\.managedObjectContext) var context

    var body: some View {
    
        VStack{
            
            HStack {
                
//                Text("\(homeData.updateItem)")
                Text("\(homeData.updateItem == nil ? "Add New" : "Update") Vibe")
                    .font(.system(size: 55))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            
            .padding()
            TextEditor(text: $homeData.content)
                .padding()
            Divider()
                .padding(.horizontal)
            HStack{
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
                
            }
            .padding()
            
            HStack(spacing: 10){
                DateButtonView(title: "Today", homeData: homeData)
                DateButtonView(title: "Tomorrow", homeData: homeData)
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            Button(action: {homeData.writeData(context: context)
            }, label: {
                Label(title: { Text(homeData.updateItem == nil ? "Add Now" : "Update")
                    
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                },
                
                icon: {Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.white)
                })
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(
                    LinearGradient(gradient: .init(colors: [Color(.cyan), Color(.black)]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)
            })
            .padding()
            .disabled(homeData.content == "" ? true : false)
            .opacity(homeData.content == "" ? 0.5 : 1)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
        

    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView(homeData: HomeViewModel())
    }
}
