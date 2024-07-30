//
//  PostReply.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct PostReply: Identifiable, Codable {
    @DocumentID var replyId: String?
    
    let postId: String
    let replyText: String
    let postReplyUserId: String
    let postUserId: String
    let timestamp: Timestamp
    
    var post: Post?
    var user: User?
    
    var id: String {
        return replyId ?? NSUUID().uuidString
    }
    
    
}
