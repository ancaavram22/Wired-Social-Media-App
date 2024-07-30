//
//  UserCell.swift
//  Wired


import SwiftUI

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        HStack {
            
            // PRPFILE IMAGE
            CircularImageView(user: user, size: .small)
            
            
            // USER NAME
            VStack(alignment: .leading, spacing: 4) {
                
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                
            }
            .foregroundStyle(.black)
            .font(.footnote)
            
            
            Spacer()
            
            
            // FOLLOW BUTTON
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color.accentColor,
                            lineWidth: 1
                        )
                }
                .foregroundStyle(Color.accentColor)
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
