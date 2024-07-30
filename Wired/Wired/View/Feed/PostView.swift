//
//  PostView.swift
//  Wired


import SwiftUI
import Kingfisher

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                // PROFILE IMAGE
                CircularImageView(user: post.user, size: .small)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack {
                        // USER NAME
                        Text(post.user?.username ?? "")
                            .font(.footnote)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        // TIME
                        Text(post.timestamp.timestampToString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                    }
                    
                    
                    
                    // POST TEXTS
                    Text(post.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                    
                    // Use Kingfisher's KFImage view to display the image from the URL
                    if let imageUrl = post.imageURL {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200) // Adjust the height as needed
                            .clipped() // Clip the image to the frame size
                            .padding(.horizontal)
                    }
                    
                    // CONTENT ACTION BUTTONS
                    ContentActionButtons(post: post)
                        .padding(.top, 5)
                        .foregroundStyle(Color.accentColor)
                    
                }
                .padding(.horizontal, 4)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Divider()
                .padding(.horizontal)
        }
    }
}

#Preview {
    PostView(post: DeveloperPreview.shared.post)
}
