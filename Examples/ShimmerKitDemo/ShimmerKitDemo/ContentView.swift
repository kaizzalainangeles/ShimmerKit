//
//  ContentView.swift
//  ShimmerKitDemo
//
//  Demonstrates ShimmerKit usage with a feed-style UI
//

import SwiftUI
import ShimmerKit

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
        
    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    // Show 3 skeleton rows
                    ForEach(0..<3, id: \.self) { _ in
                        PostCard(post: nil, isLoading: viewModel.isLoading)
                            .shimmer()
                    }
                } else {
                    // Show actual data
                    ForEach(viewModel.posts) { post in
                        PostCard(post: post, isLoading: false)
                    }
                }
            }
            .navigationTitle("Feed")
            .onAppear {
                viewModel.fetchPosts()
            }
            .toolbar {
                Button("Refresh") {
                    viewModel.posts = []
                    viewModel.fetchPosts()
                }
            }
        }
    }
}

struct PostCard: View {
    let post: Post?
    let isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(Color(uiColor: .systemGray5))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: post?.imageName ?? "")
                            .foregroundColor(.blue)
                            .unredacted()
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(post?.username ?? "Username Placeholder")
                        .font(.headline)
                        
                    Text(post?.headline ?? "This is a headline")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Text(post?.content ?? "This is a longer piece of content that takes up multiple lines in the post body.")
                .font(.body)
                .lineLimit(2)
        }
        .padding()
        .redacted(reason: isLoading ? .placeholder : [])
    }
}

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = true
    
    func fetchPosts() {
        isLoading = true
        // Simulate a 3-second network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.posts = [
                Post(username: "SwiftUI Dev", headline: "Learning Shimmers", content: "Skeleton screens are much better than spinners! Build better UX.", imageName: "sparkles"),
                Post(username: "Design_Daily", headline: "UI Trends 2026", content: "Glassmorphism is out, high-fidelity skeleton states are in.", imageName: "paintpalette"),
                Post(username: "Apple Fan", headline: "WWDC News", content: "Can't wait to see what's coming to SwiftUI this year.", imageName: "applelogo")
            ]
            self.isLoading = false
        }
    }
}

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let headline: String
    let content: String
    let imageName: String
}

#Preview {
    ContentView()
}
