//
//  DetailViewSong.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

struct DetailViewSong: View {

    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea(.all)
                VStack{
                    HStack{
                        
                        //icon-1
                        //                    Button(action:{
                        //
                        //                    },label:{
                        //                        Image(systemName: "chevron.down")
                        //                    })
                        //                    .padding([.leading,.trailing])
                        //                    Spacer()
                        
                        //title
                        Text("Yesterday")
                            .font(.title3)
                            .bold()
                            .lineLimit(5)
                            .frame(alignment: .center)
                        
                        //icon-2
                        //                    Button(action:{
                        //
                        //                    },label:{
                        //                        Image(systemName: "ellipsis")
                        //                    })
                        //                    .padding([.leading,.trailing])
                    }
//                    .padding(.top)
//                    Spacer()
                    
                    //image
                    Image("1.png")
                        .resizable()
                    
                        .frame(width: 300, height: 300)
                        .cornerRadius(30)
                    
//                    Spacer()
                    
                    //bottom
                    HStack{
                        VStack(alignment:.leading){
                            Text("Artist: The Beatles")
                                .font(.title)
                                .fontWeight(.regular )
                            Text("From : Help (1965)")
                                .font(.subheadline)
                            Text("Duration: 3:00 minute")
                                .font(.subheadline)
                            
                            Text("Yesterday is one of the most recorded songs in the history of popular music. Its entry in Guinness World Records states. ")
                                .fontWeight(.thin)
                                .lineLimit(5)
                                .lineSpacing(1)
                        }
                        Spacer()
                        
                        Button(action:{
                            
                        },label:{
                            Image(systemName: "heart.fill")
                        })
                        .font(.title)
                        .foregroundColor(.red)
                    }
                    .padding([.trailing,.leading])
                    
                    //progress
                    ProgressView(value: 0.3)
                        .padding([.leading,.trailing ])
                    
                    MediaControls()
                        .padding([ .leading,.trailing,.top],20)
                        .padding(.bottom,40)
                }
                .foregroundColor(.white)
            }
        }
        
                         
        
    }
}


//struct DetailViewSong_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewSong()
//    }
//}
