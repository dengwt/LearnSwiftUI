//
//  TestPath.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2021/3/31.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import Foundation
import SwiftUI

struct TestPath: View {
    var screenBounds = UIScreen.main.bounds
    
    var body: some View {
        let mWidth = screenBounds.width
        let mHeight = screenBounds.height
        let hCount = mHeight / 20
        let vCount = mWidth / 20
        
        ZStack {
            Path { path in
                // draw grid line (horizontal)
                for i in 0..<Int(hCount) {
                    path.move(to: CGPoint(x: 0, y: i * 20))
                    path.addLine(to: CGPoint(x: Double(mWidth), y: 20 * Double(i)))
                }
                
                // draw grid line (vertical)
                for i in 0..<Int(vCount) {
                    path.move(to: CGPoint(x: i * 20, y: 0))
                    path.addLine(to: CGPoint(x: 20 * Double(i), y: Double(mHeight)))
                }
            }
            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            .border(Color.orange, width: 10)
            
            // draw sword
            Path { path in
                path.move(to:CGPoint(x:180,y:40))
                path.addArc(center: CGPoint(x: 150, y: 33), radius: 15, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 270), clockwise: false)
                path.addLine(to: CGPoint(x: 240, y:20))
                path.addLine(to: CGPoint(x:260,y:40))
                path.addLine(to: CGPoint(x:225,y:40))
                path.addLine(to: CGPoint(x:225,y:140))
                path.addLine(to: CGPoint(x:280,y:180))
                path.addLine(to: CGPoint(x:270,y:200))
                path.addLine(to: CGPoint(x:225,y:190))
                path.addLine(to: CGPoint(x:255,y:700))
                path.addLine(to: CGPoint(x:180,y:600))
                path.addLine(to: CGPoint(x:190,y:180))
                path.addLine(to: CGPoint(x:170,y:170))
                path.addLine(to: CGPoint(x:180,y:140))
                path.addLine(to: CGPoint(x:198,y:130))
                path.addLine(to: CGPoint(x:199,y:40))
                path.addLine(to: CGPoint(x:180,y:40))
            }
//            .fill(LinearGradient(gradient: Gradient(colors: [.pink,.clear,.gray,.green,.purple,.black,.blue,.red,.orange]), startPoint: .top, endPoint: .bottom))
            .stroke(LinearGradient(gradient: Gradient(colors: [.pink,.clear,.gray,.green,.purple,.black,.blue,.red,.orange]), startPoint: .top, endPoint: .bottom), lineWidth: 5)
            .shadow(color: .pink, radius: 12.0, x: 11.0, y: 11.0)
            .border(Color.blue, width: 2)      
        }
    }
    
}

#if DEBUG
struct TestPath_Previews: PreviewProvider {
    static var previews: some View {
        TestPath()
    }
}
#endif
