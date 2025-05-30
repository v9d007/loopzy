//
//  HomeView.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//


import SwiftUI

// MARK: - Home View
struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    // Top Navigation Bar
                    HStack {
                        Text("Following")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.6))
                        
                        Spacer()
                        
                        Text("For You")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "tv")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    // Video Feed Placeholder
                    Text("Video Feed Goes Here")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Discover View
struct DiscoverView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.6))
                        
                        Text("Search")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "qrcode.viewfinder")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Text("Discover Content Goes Here")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Create View
struct CreateView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("Create")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        CreateOptionButton(icon: "camera.fill", title: "Camera", subtitle: "Record a video")
                        CreateOptionButton(icon: "photo.on.rectangle", title: "Upload", subtitle: "Choose from gallery")
                        CreateOptionButton(icon: "waveform", title: "Go Live", subtitle: "Start live streaming")
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
        .navigationBarHidden(true)
    }
}

struct CreateOptionButton: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Inbox View
struct InboxView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    // Header
                    HStack {
                        Text("Inbox")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Tabs
                    HStack {
                        InboxTabButton(title: "All activity", isSelected: true)
                        InboxTabButton(title: "Messages", isSelected: false)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    Text("Messages and Notifications")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct InboxTabButton: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 16, weight: isSelected ? .semibold : .medium))
                    .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                
                Rectangle()
                    .fill(isSelected ? Color.white : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Profile View
struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    // Header
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "person.badge.plus")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("Profile")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    // Profile Content Placeholder
                    VStack(spacing: 20) {
                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 80, height: 80)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white.opacity(0.6))
                            )
                        
                        Text("@username")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("Profile Content Goes Here")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview("Home") {
    HomeView()
        .preferredColorScheme(.dark)
}

#Preview("Discover") {
    DiscoverView()
        .preferredColorScheme(.dark)
}

#Preview("Create") {
    CreateView()
        .preferredColorScheme(.dark)
}

#Preview("Inbox") {
    InboxView()
        .preferredColorScheme(.dark)
}

#Preview("Profile") {
    ProfileView()
        .preferredColorScheme(.dark)
}