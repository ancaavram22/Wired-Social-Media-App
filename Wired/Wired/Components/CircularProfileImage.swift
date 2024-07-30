
import SwiftUI
import Kingfisher


// PROFILE IMAGE SIZE ENUMERTION
enum ProfileImageSize {
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        }
            
    }
}
struct CircularImageView: View {
    
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user?.profileImageUrl {
            
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
            
        } else {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularImageView(user: DeveloperPreview.shared.user, size: .medium)
}
