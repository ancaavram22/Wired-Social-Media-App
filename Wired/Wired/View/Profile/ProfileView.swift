//
//  ProfileView.swift
//  Wired

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
        ScrollView {
            
            // USER BIO AND STATS
            VStack(spacing: 20) {
                
                ProfileHeaderView(user: user)
                
                // FOLLOW BUTTON
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .foregroundStyle(.white)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
                
                // USER CONTENT LIST VIEW
                UserContentListView(user: user)
                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
        
        
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}

