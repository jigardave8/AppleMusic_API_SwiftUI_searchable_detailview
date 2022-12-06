//
//  CategoriesView.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

struct CategoriesView: View {
    var column = [GridItem(.adaptive(minimum: 150))]

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
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: column) {
                ForEach(filteredCategories, id: \.id) { category in
                    NavigationLink {
                        DetailCategoryGrid(category: category)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack {
                            Image(category.imageName ?? "")
                                .resizable()
                                .frame(minWidth: 170, minHeight: 120)
                                .scaledToFit()
                                .cornerRadius(12)
                        }
                    }
                }
            }
//            .searchable(text: $searchCategory, prompt: "Search category")
            .padding(15)
        }
    }
}

//struct SearchCategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView()
//    }
//}
