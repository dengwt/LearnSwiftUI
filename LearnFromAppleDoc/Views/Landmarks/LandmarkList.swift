//
//  LandmarkList.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2019/10/22.
//  Copyright © 2019 LIANDI. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(ModelData())
            //        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {deviceName in
            //            LandmarkList()
            //                .previewDevice(PreviewDevice(rawValue: deviceName))
            //                .previewDisplayName(deviceName)
            //        }
        }
    }
}
