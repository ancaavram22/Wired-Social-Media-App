//
//  User.swift
//  Wired


import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let fullname: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
