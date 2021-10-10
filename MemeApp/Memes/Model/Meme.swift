//
//  Meme.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import Foundation

struct Meme: Codable {
    let id: String
    let name: String
    let url: String
    var width: Double
    var height: Double
    let boxCount: Int
    
    mutating func adjustWidthHeight(toWidth: Double) {
        self.height = self.height * (self.width/toWidth)
        self.width = toWidth
    }
}

extension Meme {
    static let dummyData: [Meme] = [
        Meme(id: "444", name: "Juan", url: "https://iamnojoke.com/juan.jpg", width: 350.0, height: 500.0, boxCount: 2)
    ]
}
