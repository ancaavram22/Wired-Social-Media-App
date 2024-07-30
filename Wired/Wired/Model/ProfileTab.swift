//
//  ProfileTab.swift
//  Wired

import Foundation

enum ProfileTab: Int, CaseIterable, Identifiable {
    case posts
    case replies
    
    var title: String {
        switch self {
        case .posts:
            return "Posts"
        case .replies:
            return "Replies"        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
