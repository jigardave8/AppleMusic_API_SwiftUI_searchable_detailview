//
//  DetailCategoryGrid.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//
import SwiftUI

struct DetailCategoryGrid: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var category = CategoryModel()
    var column = [GridItem(.flexible())]
    
    @StateObject var songInPlayer = SongModelObservable()
    
    @State var songs = SongsList.items
    
    @State var searchText = ""
    @State var searchAlbum = ""
    
    var filteredSongs: [SongModel] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.songTitle?.localizedCaseInsensitiveContains(searchText) ?? true || $0.album?.localizedCaseInsensitiveContains(searchText) ?? true || $0.musician?.localizedCaseInsensitiveContains(searchText) ?? true}
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Divider()
                    Text("Top Trending Songs")
                        .font(.system(size: 20, weight: .bold))
                        .frame(alignment: .leading)
                        .padding(.leading, 15)
                    LazyVGrid(columns: column, alignment: .leading, content: {
                        ForEach(filteredSongs, id: \.self) { song in
                            HStack(alignment: .center) {
                                Button {
                                    songInPlayer.songTitle = song.songTitle ?? ""
                                } label: {
                                    Image(song.imageName ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                }
                                VStack(alignment: .leading) {
                                    Text(song.songTitle ?? "")
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    Text(song.musician ?? "")
                                        .font(.callout)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 5)
                                    Text("Trending · \(song.album ?? "")")
                                        .font(.callout)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.secondary)
                                }
                            }
                            Divider()
                        }
                    })
                    //                    .searchable(text: $searchText, prompt: "Search song or album")
                    .padding(.leading, 15)
                    .padding(.bottom, 90)
                }
            }
            
        }
        .environmentObject(songInPlayer)
    }
}

struct DetailCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCategoryGrid()
    }
}
