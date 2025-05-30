//
//  AppRouter.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 26/05/25.
//

import SwiftUI
import Combine

// MARK: - Route Enum
enum AppRoute: Hashable {
    case auth(AuthRoute)
    case main(MainTabRoute)
    
    enum AuthRoute: Hashable {
        case login
        case signup
        case forgotPassword
    }
    
    enum MainTabRoute: Hashable {
        case home
        case discover
        case create
        case inbox
        case profile(ProfileRoute)
        
        enum ProfileRoute: Hashable {
            case main
            case settings
            case editProfile
        }
    }
}

// MARK: - AppRouter
class AppRouter: ObservableObject {
    // Published property to track navigation path
    @Published var navigationPath = NavigationPath()
    
    // Current active tab
    @Published var currentTab: AppRoute.MainTabRoute = .home
    
    // Singleton instance
    static let shared = AppRouter()
    
    // Prevent external instantiation
    private init() {}
    
    // MARK: - Navigation Methods
    
    func navigate(to route: AppRoute) {
        navigationPath.append(route)
    }
    
    func navigateToTab(_ tab: AppRoute.MainTabRoute) {
        currentTab = tab
        // Clear any navigation stack when switching tabs
        navigationPath = NavigationPath()
    }
    
    func goBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func popToRoot() {
        navigationPath = NavigationPath()
    }
    
    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func popToRootAndNavigate(to route: AppRoute) {
        popToRoot()
        navigate(to: route)
    }
    
    // Navigate to a specific tab and then to a specific screen
    func navigateToTab(_ tab: AppRoute.MainTabRoute, then route: AppRoute) {
        currentTab = tab
        navigationPath = NavigationPath()
        navigate(to: route)
    }
}
