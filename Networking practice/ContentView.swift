//
//  ContentView.swift
//  Networking practice
//
//  Created by kalyan on 3/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = JokeViewModel()
    var body: some View {
        NavigationStack{
            Group{
                if viewModel.isLoading{
                    ProgressView("Loading tasks")
                    
                }else if let error = viewModel.errorMessage{
                    VStack(spacing: 12){
                        Image(systemName: "wifi.slash")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                        Text(error)
                            .font(.title)
                            .foregroundStyle(.red)
                        
                        Button("retry"){
                            Task{await viewModel.fetchData()}
                        }
                    }
                }else if let joke = viewModel.joke{
                    VStack(spacing: 12){
                        Text(joke.setup)
                            .font(.title)
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.center)
                        Text(joke.punchline)
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("NewJoke"){
                            Task{await viewModel.fetchData()}
                        }.buttonStyle(.bordered).foregroundStyle(.green).padding()
                    }
                    
                    }
                }.navigationTitle("Joke app")
            }
             .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
