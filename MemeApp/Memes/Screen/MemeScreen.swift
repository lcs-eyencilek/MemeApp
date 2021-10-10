//
//  MemeScreen.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeScreen: View {
    
    @StateObject private var vm = MemeViewModel(
        caller: APICaller()
    )
    
    var body: some View {
        if #available(iOS 15.0, *) {
            
            Group {
                if vm.memes.isEmpty {
                    LoadingView(text: "Fetching Data")
                } else {
                    List {
                        ForEach(vm.memes, id: \.id) { item in
                            MemeView(item: item)
                        }
                    }
                }
            }
            .task {
                // With task method, you make the view wait for the code inside the task block to be executed before appearing, or loading
                await vm.getMemes()
            }
        } else {
            // Fallback on earlier versions
            List {
                ForEach(Meme.dummyData, id: \.id) { item in
                    MemeView(item: item)
                }
            }
        }
    }
}

struct MemeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MemeScreen()
    }
}
