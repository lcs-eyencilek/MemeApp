//
//  SearchBar.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-16.
//

import SwiftUI
 
struct SearchBar: View {
    @Binding var text: String
    
    @Binding var arrayChange: [Meme]
    
    @ObservedObject var vm: MemeViewModel
    
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }.onChange(of: text) { _ in
                    arrayChange = vm.filteredMemes(searchText: text)
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
