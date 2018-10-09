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
    var starCount: Int
    var html: String

    private enum CodingKeys: String, CodingKey {
        case name
        case owner
        case starCount = "stargazers_count"
        case html = "html_url"
    }
}

struct Owner: Decodable {
    var login: String
    var avatarURL: String
    private enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        //APIでloginやavatar_urlと一致する情報をそれぞれの変数に格納する

    }
}
