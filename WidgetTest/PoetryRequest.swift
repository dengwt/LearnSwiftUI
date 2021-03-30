//
//  PoetryRequest.swift
//  WidgetTestExtension
//
//  Created by LIANDI on 2021/3/30.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import Foundation

struct PoetryRequest {
    static func request(completion: @escaping (Result<Poetry, Error>) -> Void) {
        let url = URL(string: "https://v1.alapi.cn/api/shici?type=shuqing")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let poetry = convertJsonToPoetry(data: data!)
            completion(.success(poetry))
        }
        task.resume()
    }
    
    static func convertJsonToPoetry(data: Data) -> Poetry {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        guard let data = json["data"] as? [String: Any] else {
            return Poetry(content: "request failed", origin: "", author: "")
        }
        let content = data["content"] as! String
        let origin = data["origin"] as! String
        let author = data["author"] as! String
        
        return Poetry(content: content, origin: origin, author: author)
    }
}
