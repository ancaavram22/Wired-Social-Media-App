//
//  CurrentUserProfileView.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @StateObject var feedViewModel = FeedViewModel()
    

    @State var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // USER BIO AND STATS
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
            
                    // FOLLOW BUTTON
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 352, height: 32)
                            .foregroundStyle(Color.accentColor)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.accentColor, lineWidth: 1)
                            }
                        
                    }
                    
                    
                    // USER CONTENT LIST VIEW
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
                
            }
            .refreshable {
                Task {
                    try await feedViewModel.fetchPosts()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

#Preview {
    CurrentUserProfileView()
}
