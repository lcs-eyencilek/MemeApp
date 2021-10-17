//
//  CaptureView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-16.
//

import SwiftUI

struct CaptureView: View {
    
    var captureMeme: Meme
    
    var CaptureScreen: some View  {
        Image(uiImage: captureMeme.url.loadUIImage())
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                  
                HStack {
                    CaptureScreen
                }
                //.frame(width: 500, height: 500, alignment: .center)
                    Button("Save to image") {
                        let image = CaptureScreen.snapshot()
                        
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                    .font(.title2)
                Spacer()
            }
            
            Spacer()
        }
    }
}

//struct CaptureView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaptureView()
//    }
//}
