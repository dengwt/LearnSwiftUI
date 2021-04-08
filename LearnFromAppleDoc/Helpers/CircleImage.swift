//
//  CircleImage.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2019/10/12.
//  Copyright © 2019 LIANDI. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(color: Color.gray, radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
