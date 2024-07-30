//
//  FirestoreConstants.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import Foundation
import Firebase


struct FirestoreConstants {
    
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    static let PostCollection = Root.collection("posts")
    static let FollowerCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    static let RepliesCollection = Root.collection("replies")
    static let ActivitiesCollection = Root.collection("activities")
    
}
