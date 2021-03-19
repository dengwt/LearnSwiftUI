//
//  HomeView.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2020/6/19.
//  Copyright © 2020 LIANDI. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
//    var profileButton: some View {
//        Button(action: {
//            self.showingProfile.toggle()
//        }) {
//            Image(systemName: "person.crop.circle")
//                .imageScale(.large)
//                .accessibility(label: Text("User Profile"))
//                .padding()
//        }
//    }
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    HomeRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}
