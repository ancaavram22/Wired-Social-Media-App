//
//  CurrentUserProfileViewModel.swift
//  Wired
//
//  Created by Anca Avram on 03.05.2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI


class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
    
    
}
