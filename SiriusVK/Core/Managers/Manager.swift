//
//  Manager.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import Foundation

protocol Manager {
    func fetchApps(completion: @escaping (Result<VKResponse, Error>) -> ())
}
