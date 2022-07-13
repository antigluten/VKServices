//
//  VKResponse.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import Foundation

struct VKResponse: Codable {
    let body: VKBody
    let status: Int
}

struct VKBody: Codable {
    let services: [VKApp]
}
