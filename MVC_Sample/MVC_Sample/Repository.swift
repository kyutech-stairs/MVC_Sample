//
//  Repository.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import Foundation
import UIKit

class Repository {
    var name: String
    var owner: String
    var starCount: Int
    var imagePath: String
    var path: String
    
    init(name: String, owner: String, starCount: Int, imagePath: String, path: String) {
        self.name = name
        self.owner = owner
        self.starCount = starCount
        self.imagePath = imagePath
        self.path = path
    }
    
    class func fetchRepository(q: String, completion: @escaping ([Repository]) -> Void) {
        let url: String = "https://api.github.com/search/repositories?q=\(q)&sort=stars"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error == nil, let data = data {
                let decoder = JSONDecoder()
                do {
                    let result: Result = try decoder.decode(Result.self, from: data)
                    var repositories: [Repository] = []
                    _ = result.items.map ({
                        let repository = Repository(name: $0.name, owner: $0.owner.login, starCount: $0.starCount, imagePath: $0.owner.avatarURL, path: $0.html)
                        repositories.append(repository)
                    })
                    completion(repositories)
                } catch(let err) {
                    print(err)
                }
            } else {
                print(error!)
            }
            }.resume()
    }
}
