//
//  PoetryRequest.swift
//  WidgetTestExtension
//
//  Created by LIANDI on 2021/3/30.
//  Copyright © 2021 LIANDI. All rights reserved.
//

import Foundation
import SwiftUI

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
            return Poetry(content: "request failed", origin: "", author: "", icon: UIImage(named: "hiddenlake"))
        }
        let content = data["content"] as! String
        let origin = data["origin"] as! String
        let author = data["author"] as! String
        
        var image: UIImage? = nil
        if let imageData = try? Data(contentsOf: URL(string: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1058052610,2039041423&fm=26&gp=0.jpg")!) {
            image = UIImage(data: imageData)
        }
        
        return Poetry(content: content, origin: origin, author: author, icon: image)
    }
}
