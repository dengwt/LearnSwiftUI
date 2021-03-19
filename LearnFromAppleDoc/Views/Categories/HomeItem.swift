//
//  HomeItem.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2021/2/24.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import SwiftUI

struct HomeItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeItem(landmark: ModelData().landmarks[0])
    }
}
