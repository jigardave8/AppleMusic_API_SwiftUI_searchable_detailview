//
//  MediaControls.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

struct MediaControls: View {
    var body: some View {
        HStack{
            Button(action: {
            }, label: {
                Image(systemName: "shuffle")
            })
            .foregroundColor(.green)
            .padding([.leading,.trailing])
            Spacer()
            
            Button(action: {
            }, label: {
                Image(systemName: "backward.end.fill")
            })
            .font(.largeTitle)
            
            Button(action: {
            }, label: {
                Image(systemName: "play.circle.fill")
            })
            .font(.system(size:65))
            .padding([ .leading,.trailing])
            
            Button(action: {
            }, label: {
                Image(systemName: "forward.end.fill")
            })
            .font(.largeTitle)
            Spacer()
            
            Button(action: {
            }, label: {
                Image(systemName: "repeat")
            })
            .padding([.leading,.trailing])
            .foregroundColor(Color("Color-2"))
        }    }
}

struct MediaControls_Previews: PreviewProvider {
    static var previews: some View {
        MediaControls()
    }
}
