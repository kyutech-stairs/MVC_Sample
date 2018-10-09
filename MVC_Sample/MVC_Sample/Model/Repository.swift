//
//  Repository.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import Foundation

class Repository {

    //Githubのリポジトリの情報を持ってきたい
    var name: String
    var owner: String   //companyname
    var starCount: Int
    var imagePath: String
    var path: String

    init(name: String, owner: String, starCount: Int, imagePath: String, path: String){
        self.name = name
        self.owner = owner
        self.starCount = starCount
        self.imagePath = imagePath
        self.path = path
    }

    //escaping APIの結果が返ってきてから実行したい時に使う
    class func fetchRepository(q: String, completion: @escaping ([Repository]) -> Void) {

        let url = URL( string: "https://api.github.com/search/repositories?q=\(q)&sort=stars")

        URLSession.shared.dataTask(with: url!){ (data, response, error) in
            if error == nil, let data = data {
                let decoder = JSONDecoder()
                do{
                    let result: Result = try decoder.decode(Result.self, from: data)
                    var repositories: [Repository] = []
                    _ = result.items.map({
                        let repository = Repository(name: $0.name, owner: $0.owner.login, starCount: $0.starCount, imagePath: $0.owner.avatarURL, path: $0.html)
                        repositories.append(repository)

                    })
                    completion(repositories)    //Viewに反映させる

                }catch(let error) {
                    print(error)
                }
            }
    }.resume()

}
}

