//
//  FeedView.swift
//  Wired


import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(viewModel.posts) { post in
                        
                        NavigationLink(value: post) {
                            PostView(post: post)
                        }
                        
                    }
                    
                }
            
            }
            .refreshable {
                Task {
                    try await viewModel.fetchPosts()
                }
            }
            .navigationTitle("Wired")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Post.self, destination: { post in
                PostDetailsView(post: post)
            })
            .scrollIndicators(.hidden)
           
            
        }
        
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
