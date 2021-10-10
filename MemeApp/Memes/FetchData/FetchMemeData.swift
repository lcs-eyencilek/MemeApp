//
//  FetchMemeData.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import Foundation

protocol FetchData {
    @available(iOS 15.0.0, *)
    func fetch() async throws -> [Meme]
}

final class APICaller: FetchData {
    @available(iOS 15.0.0, *)
    func fetch() async throws -> [Meme] {
        // Create a url session
        let urlSession = URLSession.shared
        // Create your url with appending the route onto the base link
        let url = URL(string: AppData.baseUrl.appending("/get_memes"))
        let (data, _) = try await urlSession.data(from: url!)
        // Decode the json data in the formate of an array of quotes, the reason why we conformed the quote struct to decodable is to be able to use it here as a decoding format
        let finalData = try JSONDecoder().decode([Meme].self, from: data)
        print(finalData)
        return finalData
    }
    
    
}
