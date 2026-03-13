//
//  Tasks.swift
//  Networking practice
//
//  Created by kalyan on 3/12/26.
//

import Foundation


struct JokeView: Codable, Identifiable{
    let id: Int
    let type: String
    let setup : String
    let punchline : String
}
