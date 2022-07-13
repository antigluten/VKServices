//
//  VKApp.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import Foundation

struct VKApp: Codable {
    let name: String
    let description: String
    let link: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case icon = "icon_url"
    }
}
