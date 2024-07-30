//
//  UploadPostViewModel.swift
//  Wired

import Foundation
import Firebase


class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post =  Post(userId: uid, caption: caption, timestamp: Timestamp(), likes: 0, replies: 0)
        try await PostService.uploadPost(post)
    }
    
}
