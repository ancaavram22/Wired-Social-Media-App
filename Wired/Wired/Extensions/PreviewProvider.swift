//
//  PreviewProvider.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import SwiftUI
import Firebase

//extension PreviewProvider {
//    static var dev: DeveloperPreview {
//        return DeveloperPreview.shared
//    }
//}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(
        id: NSUUID().uuidString,
        email: "tony@gmail.com",
        fullname: "Tony Stark",
        username: "ironman"
    )
    
    
    lazy var post = Post(
        userId: NSUUID().uuidString,
        caption: "This is a post.",
        timestamp: Timestamp(),
        likes: 0,
        replies: 0,
        user: user,
        imageURL: "logo"
        
    )
    
    lazy var reply = PostReply(
        postId: "123",
        replyText: "This is a reply.",
        postReplyUserId: "124",
        postUserId: "354",
        timestamp: Timestamp(),
        post: post,
        user: user
    )

}
