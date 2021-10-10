//
//  MemeView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-09.
//

import SwiftUI

struct MemeView: View {
    
    let item: Meme

    var body: some View {
        Text("\(item.name)")
        Image("\(item.url)")
    }
}
