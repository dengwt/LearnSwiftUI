//
//  WidgetTest.swift
//  WidgetTest
//
//  Created by LIANDI on 2021/3/30.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct PoetryProvider: TimelineProvider {
    func placeholder(in context: Context) -> PoetryEntry {
        let poetry = Poetry(content: "床前明月光，疑似地上霜", origin: "耐依福", author: "佚名")
        return PoetryEntry(date: Date(), poetry: poetry)
    }

    func getSnapshot(in context: Context, completion: @escaping (PoetryEntry) -> ()) {
        let poetry = Poetry(content: "床前明月光，疑似地上霜", origin: "月光光", author: "佚名")
        let entry = PoetryEntry(date: Date(), poetry: poetry)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<PoetryEntry>) -> ()) {
        let currentDate = Date()
        let updateDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)
        
        PoetryRequest.request { result in
            let poety: Poetry
            if case .success(let response) = result {
                poety = response
            } else {
                poety = Poetry(content: "诗词加载失败，请稍微再试！", origin: "耐依福", author: "佚名")
            }
            let entry = PoetryEntry(date: currentDate, poetry: poety)
            let timeline = Timeline(entries: [entry], policy: .after(updateDate!))
            completion(timeline)
        }

    }
}

struct PoetryEntry: TimelineEntry {
    let date: Date
    let poetry: Poetry
}

struct PoetryWidgetView : View {
    var entry: PoetryProvider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.poetry.origin)
                .font(.system(size: 20))
                .fontWeight(.bold)
            Text(entry.poetry.author)
                .font(.system(size: 16))
                .fontWeight(.bold)
            Text(entry.poetry.content)
                .font(.system(size: 18))
                .fontWeight(.bold)
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

@main
struct WidgetTest: Widget {
    let kind: String = "WidgetTest"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PoetryProvider()) { entry in
            PoetryWidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetTest_Previews: PreviewProvider {
    static var previews: some View {
        PoetryWidgetView(entry: PoetryEntry(date: Date(), poetry: Poetry(content: "床前明月光，疑似地上霜", origin: "耐依福", author: "佚名")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
