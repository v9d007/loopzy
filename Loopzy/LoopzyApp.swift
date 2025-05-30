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
    
    var body: some View {
        Group {
            if coordinator.isAuthenticated {
                MainTabView()
            } else {
                AuthView()
            }
        }
        .animation(.easeInOut, value: coordinator.isAuthenticated)
    }
}

struct AuthView: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var coordinator: AppCoordinator
    
    // Simulating login for demo purposes
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack(spacing: 20) {
                Image(systemName: "infinity")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.purple)
                
                Text("Welcome to Loopzy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Simulate login
                    withAnimation {
                        coordinator.isAuthenticated = true
                    }
                }) {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
                HStack {
                    Button("Forgot Password?") {
                        router.navigate(to: .auth(.forgotPassword))
                    }
                    .foregroundColor(.purple)
                    
                    Spacer()
                    
                    Button("Sign Up") {
                        router.navigate(to: .auth(.signup))
                    }
                    .foregroundColor(.purple)
                }
                
                Spacer()
            }
            .padding()
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .auth(let authRoute):
                    switch authRoute {
                    case .login:
                        Text("Login") // Should not happen here
                    case .signup:
                        SignupView()
                    case .forgotPassword:
                        ForgotPasswordView()
                    }
                case .main:
                    Text("Main") // Should not happen in auth flow
                }
            }
        }
    }
}
