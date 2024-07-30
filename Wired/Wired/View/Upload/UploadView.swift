//
//  UploadView.swift
//  Wired

import SwiftUI

struct UploadPostView: View {
    
    @State private var postCaption = ""
    @StateObject var viewModel = UploadPostViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    // PROFILE IMAGE VIEW
                    CircularImageView(user: user, size: .small)
                    
                    // POST CREATION TEXT FIELD
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        
                        TextField("What's new?", text: $postCaption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !postCaption.isEmpty {
                        Button(action: {
                            postCaption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color.accentColor)
                        })
                    }
                
                    
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // CANCEL BUTTON
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color.accentColor)
                }
                
                // POST BUTTON
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task {
                            try await viewModel.uploadPost(caption: postCaption)
                            dismiss()
                        }
                    }
                    .opacity(postCaption.isEmpty ? 0.5 : 1.0)
                    .disabled(postCaption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.accentColor)
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    UploadPostView()
}
