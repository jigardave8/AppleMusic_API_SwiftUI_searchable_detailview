//
//  CategoriesModel.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

struct CategoryModel: Hashable {
    var id = UUID()
    var title: String?
    var subtitle: String?
    var imageName: String?
}

class AllCategoriesObservable: ObservableObject {

    @Published var allCategories: [CategoryModel] =
    [CategoryModel(title: "1", subtitle: "2", imageName: "Audio"),
     CategoryModel(title: "3", subtitle: "4", imageName: "Romantic"),
     CategoryModel(title: "5", subtitle: "6", imageName: "Russian Pop"),
     CategoryModel(title: "7", subtitle: "8", imageName: "Russian Hip-hop"),
     CategoryModel(title: "9", subtitle: "10", imageName: "US Pop"),
     CategoryModel(title: "11", subtitle: "12", imageName: "US Hits"),
     CategoryModel(title: "13", subtitle: "14", imageName: "Good mood"),
     CategoryModel(title: "15", subtitle: "16", imageName: "Russian Hits")
    ]
}
