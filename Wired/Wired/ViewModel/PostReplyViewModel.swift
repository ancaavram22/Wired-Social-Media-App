//
//  PostReplyViewModel.swift
//  Wired


import Foundation
import Firebase


@MainActor
class PostReplyViewModel: ObservableObject {
    
    func uploadPostReply(replyText: String, post: Post) async throws {
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let reply = PostReply(
            postId: post.id,
            replyText: replyText,
            postReplyUserId: userId,
            postUserId: post.userId,
            timestamp: post.timestamp)
        
        try await PostReplyService.uploadPostReply(reply, toPost: post)
        
    }
    
}
