//
//  LoginView.swift
//  Wired


import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            
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
                    
                }
                
                
                // FORGOT PASSWORD
          //      NavigationLink(value: "accessibility") {
            //        Text("Forgot Password?")
              //          .font(.footnote)
                //        .fontWeight(.semibold)
                  //      .frame(maxWidth: .infinity, alignment: .trailing)
                    //    .foregroundStyle(Color.accentColor)
                //}
                
                
                // SIGN IN BUTTON
                AuthenticationButton(
                    buttonTitle: "Sign In",
                    buttonAction: {
                        Task {
                            try await viewModel.login()
                        }
                    }
                )
                
                Spacer()
                
                Divider()
                
                // SIGN UP REGISTRATION
                NavigationLink(value: "signup") {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
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
                
                RegistrationView()
                
            })
            
        }
        
    }
}

#Preview {
    LoginView()
}
