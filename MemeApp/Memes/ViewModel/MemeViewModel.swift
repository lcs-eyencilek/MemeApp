//
//  MemeViewModel.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

protocol ViewModelFetch: ObservableObject {
    @available(iOS 15.0.0, *)
    func getMemes() async
}

@MainActor
final class MemeViewModel: ViewModelFetch {
    @Published private(set) var memes: [Meme] = []
    
    private let caller: APICaller
    
    init(caller: APICaller) {
        self.caller = caller
    }
    
    @available(iOS 15.0.0, *)
    func getMemes() async {
        do {
            // Service class is to provide the service from the endpoint (api). This one is to transfer that service data to the view.
            self.memes = try await caller.fetch()
        } catch {
            print(error)
        }
    }
}
