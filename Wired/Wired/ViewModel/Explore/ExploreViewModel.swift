//
//  ExploreViewModel.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
