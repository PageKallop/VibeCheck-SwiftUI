//
//  HomeView.swift
//  VibeCheck-SwiftUI
//
//  Created by Page Kallop on 1/26/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel()
    @FetchRequest(entity: CheckIn.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring())
    var results : FetchedResults<CheckIn>
    @Environment(\.managedObjectContext) var context 
    
    var body: some View {
       
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack(spacing: 0){
                
                
                HStack{
                    Text("Daily Vibe")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                
                if results.isEmpty{
                    Spacer()
                    Text("No Tasks")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    Spacer()
                } else {
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(results){ checkIn in
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text(checkIn.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(checkIn.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            })
                            .foregroundColor(.black)
                            .contextMenu {
                                Button(action: {homeVM.editItem(item: checkIn)}, label: {
                                    Text("Edit")
                                })
                                
                                Button(action: {
                                    context.delete(checkIn)
                                    try! context.save()
                                }, label: {
                                    Text("Delete")
                                })
                            }
                        }
                    }.padding()
                    
                })
            }
            }
            Button(action: {homeVM.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                    
                        AngularGradient(gradient: .init(colors: [Color(.cyan), Color(.black)]), center: .center)
                    )
                    .clipShape(Circle())
            })
            .padding()
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
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
