
import SwiftUI

struct AuthenticationButton: View {
    
    var buttonTitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        
        Button(action: buttonAction, label: {
            Text(buttonTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
        })
        
    }
}

#Preview {
    AuthenticationButton(buttonTitle: "Sign In", buttonAction: {
        print("Button is pressed.")
    })
}
