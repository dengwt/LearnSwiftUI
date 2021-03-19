//
//  LandMarkApp.swift
//  LearnFromAppleDoc
//
//  Created by LIANDI on 2021/2/24.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
