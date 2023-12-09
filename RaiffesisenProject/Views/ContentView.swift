//
//  ContentView.swift
//  RaiffesisenProject
//
//  Created by Robert Saniuta on 09.12.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    @State var currentPage = 1
    
    var body: some View {
        NavigationStack {
            if viewModel.users.isEmpty {
                ProgressView("Preparing Data")
                    .onAppear{
                        viewModel.prepareData()
                    }
                    .navigationTitle("Users")
                    .toolbarBackground(Color.yellow, for: .navigationBar)
            }
            else {
                List(viewModel.users, id: \.id) { user in
                    UserRow(user: user)
                        .onAppear(perform: {
                        if user.id == viewModel.users[viewModel.users.count - 3].id {
                            loadNextPage()
                        }
                    })
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Users")
                .toolbarBackground(Color.yellow, for: .navigationBar)
                
            }
        }
    }
    
    private func loadNextPage() {
        // load data
    }
}

#Preview {
    ContentView()
}
