//
//  AppCoordinator.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 26/05/25.
//


import SwiftUI
import Combine

// MARK: - AppCoordinator
class AppCoordinator: ObservableObject {
    // Singleton instance
    static let shared = AppCoordinator()
    
    // Router reference
    private let router = AppRouter.shared
    
    // Auth state
    @Published var isAuthenticated: Bool = false
    
    // User data
    @Published var currentUser: User?
    
    // Cancellables for managing subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    private init() {
        setupBindings()
    }
    
    private func setupBindings() {
        // Example: Listen for authentication state changes
        // In a real app, this would be connected to your auth service
        $isAuthenticated
            .sink { [weak self] isAuthenticated in
                if isAuthenticated {
                    self?.handleSuccessfulAuthentication()
                } else {
                    self?.handleLogout()
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Auth Flow
    func handleSuccessfulAuthentication() {
        // Navigate to main app interface
        withAnimation {
            router.navigateToTab(.home)
        }
    }
    
    func handleLogout() {
        currentUser = nil
        // Navigate to login screen
        withAnimation {
            router.popToRoot()
            router.navigate(to: .auth(.login))
        }
    }
    
    // MARK: - Navigation Helpers
    
    func navigateToProfile(userId: String) {
        router.navigateToTab(.profile(.main))
    }
    
    func navigateToContent(contentId: String) {
        // Implementation would depend on your content model
        router.navigateToTab(.home)
        // Then navigate to specific content
    }
    
    func navigateToCreateContent() {
        router.navigateToTab(.create)
    }
    
    func navigateToSettings() {
        router.navigateToTab(.profile(.main))
        router.navigate(to: .main(.profile(.settings)))
    }
    
    // MARK: - Deeplink Handling
    func handleDeepLink(_ url: URL) {
        // Parse URL and navigate accordingly
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        
        // Example: Handling various deeplink paths
        let path = components.path
        
        switch path {
        case "/profile":
            if let userId = components.queryItems?.first(where: { $0.name == "id" })?.value {
                navigateToProfile(userId: userId)
            }
        case "/content":
            if let contentId = components.queryItems?.first(where: { $0.name == "id" })?.value {
                navigateToContent(contentId: contentId)
            }
        default:
            break
        }
    }
}

// Placeholder User model - Replace with your actual model
struct User: Identifiable, Equatable {
    let id: String
    let username: String
    let email: String
    // Add other properties as needed
}