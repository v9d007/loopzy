//
//  LoopzyApp.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 21/05/25.
//

import SwiftUI

@main
struct LoopzyApp: App {
    @StateObject private var coordinator = AppCoordinator.shared
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
                .environmentObject(AppRouter.shared)
                .onOpenURL { url in
                    // Handle deep links
                    coordinator.handleDeepLink(url)
                }
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    switch newPhase {
                    case .active:
                        print("App became active")
                        // Refresh content or check authentication status
                    case .inactive:
                        print("App became inactive")
                    case .background:
                        print("App went to background")
                        // Save state or perform cleanup
                    @unknown default:
                        print("Unknown scene phase")
                    }
                }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        Group {
            if coordinator.isAuthenticated {
                MainTabView()
            } else {
                NavigationStack(path: $router.navigationPath) {
                    AuthView()
                        .navigationDestination(for: AppRoute.self) { route in
                            destinationView(for: route)
                        }
                }
            }
        }
        .animation(.easeInOut, value: coordinator.isAuthenticated)
    }
    
    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .auth(let authRoute):
            switch authRoute {
            case .login:
                EmptyView()
            case .signup:
                SignupView()
            case .forgotPassword:
                ForgotPasswordView()
            }
        case .main:
            EmptyView() // Should not happen in auth flow
        }
    }
}

