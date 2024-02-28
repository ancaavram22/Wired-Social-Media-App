//
//  ProfileView.swift
//  Wired
//
//  Created by Anca Avram on 10.01.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            //header
            VStack{
                //pic and stats
                HStack{
                    Image("iron-man")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height:80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing:8) {
                        
                        VStack{
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Posts")
                                .font(.footnote)
                        }
                        .frame(width: 80)
                        
                        VStack{
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Followers")
                                .font(.footnote)
                        }
                        .frame(width: 80)
                        
                        VStack{
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Following")
                                .font(.footnote)
                        }
                        .frame(width: 80)
                    }
                
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
                
                //name and bio
                VStack(alignment: .leading, spacing: 4){
                    Text("Iron Man")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("Tony Stark")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 4)
                //action button
                
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                
                Divider()
            }
            
            //post grid view
        }
    }
}

struct ProfileView_Previews:PreviewProvider{
    static var previews: some View{
        ProfileView()
    }
}
