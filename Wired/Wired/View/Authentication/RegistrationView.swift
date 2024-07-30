//
//  RegistrationView.swift
//  Wired

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        
        VStack(spacing: 20) {
            
            Spacer()
            
            // LOGO IMAGE
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            // TEXT FIELDS
            VStack(spacing: 20) {
                
                TextField("Enter your email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(AuthenticationTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(AuthenticationTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(AuthenticationTextFieldModifier())
                
                TextField("Enter your user name", text: $viewModel.username)
                    .modifier(AuthenticationTextFieldModifier())
                
            }
            
            
            // SIGN UP BUTTON
            AuthenticationButton(
                buttonTitle: "Sign Up",
                buttonAction: {
                    Task {
                        try await viewModel.register()
                    }
                }
            )
            
            Spacer()
            
            Divider()
            
            // SIGN UP REGISTRATION
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                        
                }
                .font(.footnote)
                .foregroundStyle(Color.accentColor)
            }
            .padding(.vertical)
            
        }
        .tint(Color.accentColor)
        .padding(.horizontal)
        .navigationDestination(for: String.self, destination: { string in
            
            
            
        })
        
    }
    
    
}

#Preview {
    RegistrationView()
}
