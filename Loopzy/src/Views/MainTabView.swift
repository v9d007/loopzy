//
//  MainTabView.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == .home ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == .home ? .fill : .none)
                }
                .tag(Tab.home)
            
            DiscoverView()
                .tabItem {
                    Image(systemName: selectedTab == .discover ? "magnifyingglass.circle.fill" : "magnifyingglass")
                        .environment(\.symbolVariants, selectedTab == .discover ? .fill : .none)
                }
                .tag(Tab.discover)
            
            CreateView()
                .tabItem {
                    Image(systemName: "plus.app")
                        .font(.system(size: 20, weight: .medium))
                }
                .tag(Tab.create)
            
            InboxView()
                .tabItem {
                    Image(systemName: selectedTab == .inbox ? "message.fill" : "message")
                        .environment(\.symbolVariants, selectedTab == .inbox ? .fill : .none)
                }
                .tag(Tab.inbox)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                }
                .tag(Tab.profile)
        }
        .accentColor(Color.loopzyPrimary)
        .onAppear {
            setupTabBarAppearance()
        }
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        
        // Unselected item appearance
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.6)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white.withAlphaComponent(0.6)
        ]
        
        // Selected item appearance
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

enum Tab: CaseIterable {
    case home
    case discover
    case create
    case inbox
    case profile
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .discover: return "Discover"
        case .create: return "Create"
        case .inbox: return "Inbox"
        case .profile: return "Profile"
        }
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.dark)
}
