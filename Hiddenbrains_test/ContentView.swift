//
//  ContentView.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//


import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: SongListViewModel
    var category = CategoryModel()
    @StateObject var songInPlayer = SongModelObservable()
    
    @State var songs = SongsList.items
    
    @StateObject var categories = AllCategoriesObservable()
    @State var searchCategory = ""
    var filteredCategories: [CategoryModel] {
        if searchCategory.isEmpty {
            return categories.allCategories
        } else {
            return categories.allCategories.filter { $0.title?.localizedCaseInsensitiveContains(searchCategory) ?? true
            }
        }
    }
    
    
    var body: some View {
        
        var category = CategoryModel()
        var column = [GridItem(.flexible())]
        
        
        
        NavigationView {
            VStack {
                SearchBar(searchTerm: $viewModel.searchTerm)
                if viewModel.songs.isEmpty {
                    DetailCategoryGrid()
                    
                    //                    EmptyStateView()
                    //
                }
                
                else {
                    
                    List(viewModel.songs){Song in
                        
                        NavigationLink {
                            DetailViewSong()
                        } label: {
                            SongView(song: Song)
                        }
                        
                        
                        
                    }
                    .listStyle(PlainListStyle())
                }
                
            }
            .navigationTitle("Music Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SongListViewModel())
    }
}

struct ArtworkView: View {
    let image:Image?
    var body: some View {
        ZStack{
            if image != nil {
                image
            } else {
                Color(.systemIndigo)
                Image(systemName: "music.note")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 50, height: 50)
        .shadow(radius: 5)
        .padding(.trailing, 5)
    }
}

struct SongView:View {
    @ObservedObject var song:SongViewModel
    var body: some View{
        HStack {
            ArtworkView(image: song.artwork)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct EmptyStateView : View {
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size:85))
                .padding(.bottom)
            
            Text("Start searching for music..")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
    
}

struct SearchBar: UIViewRepresentable {
    typealias UIViewtype = UISearchBar
    
    @Binding var searchTerm:String
    
    func makeUIView(context: Context) -> some UIView {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Type a song ,arttist, or album name..."
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchTerm: $searchTerm)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        @Binding var searchTerm:String
        
        init(searchTerm:Binding<String>) {
            self._searchTerm = searchTerm
        }
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchTerm = searchBar.text ?? ""
            UIApplication.shared.windows.first { $0.isKeyWindow}?.endEditing(true)
        }
    }
}
