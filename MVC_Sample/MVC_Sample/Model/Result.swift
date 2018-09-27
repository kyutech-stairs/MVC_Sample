//
//  Repository.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import Foundation

struct Result: Decodable {
    var totalCount: Int
    var items: [Item] = []
    
    private enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
}

struct Item: Decodable {
    var name: String
    var owner: Owner
    var html: String
    var starCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case owner
        case html = "html_url"
        case starCount = "stargazers_count"
    }
}

struct Owner: Decodable {
    var id: Int
    var login: String
    var avatarURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
}
