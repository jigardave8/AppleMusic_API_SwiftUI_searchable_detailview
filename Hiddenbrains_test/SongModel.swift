//
//  SongModel.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

struct SongModel: Identifiable, Hashable {
    var id = UUID()
    var songTitle: String?
    var musician: String?
    var album: String?
    var imageName: String?
}

class SongModelObservable: ObservableObject {
    @Published var songTitle = "As It Was"
    @Published var musician = "Harry Styles"
    @Published var album = "Harry's House"
    @Published var imageName = "music2"
}

struct SongsList {
    static let items: [SongModel] = [
        SongModel(songTitle: "Workinonit", musician: "J Dilla", album: "Donuts", imageName: "song1"),
        SongModel(songTitle: "New Mode", musician: "Kid Cudi", album: "Entergalactic", imageName: "song2"),
        SongModel(songTitle: "Diet Coke", musician: "Pusha T", album: "It's Almost Dry", imageName: "song3"),
        SongModel(songTitle: "I Wonder", musician: "Kanye West", album: "Graduation", imageName: "song4"),
        SongModel(songTitle: "Babushka Boi", musician: "A$AP Rocky", album: "Babushka Boi", imageName: "song5"),
        SongModel(songTitle: "90210", musician: "Travis Scott", album: "Rodeo", imageName: "song6"),
        SongModel(songTitle: "XXX", musician: "Kendrick Lamar", album: "DAMN.", imageName: "song7"),
        SongModel(songTitle: "C.R.E.A.M.", musician: "Wu-Tang Clan", album: "Enter the Wu-Tang", imageName: "song8"),
        SongModel(songTitle: "Electric Relaxation", musician: "A Tribe Called Quest", album: "The Anthology", imageName: "song9")
        ]
}
