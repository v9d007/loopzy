//
//  PrimaryButton.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//

import SwiftUI

// MARK: - Primary Action Buttons
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true
    var isLoading: Bool = false
    var buttonStyle: ButtonStyle = .filled
    
    enum ButtonStyle {
        case filled
        case outlined
        case text
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: LoopzySpacing.Button.iconSpacing) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                        .scaleEffect(0.8)
                } else {
                    Text(title)
                        .font(LoopzyTypography.Component.button)
                        .foregroundColor(foregroundColor)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, LoopzySpacing.Button.horizontalPadding)
            .padding(.vertical, LoopzySpacing.Button.verticalPadding)
            .background(backgroundColor)
            .cornerRadius(LoopzyRadius.Component.button)
            .overlay(
                RoundedRectangle(cornerRadius: LoopzyRadius.Component.button)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
        .disabled(!isEnabled || isLoading)
        .opacity(isEnabled ? 1.0 : 0.6)
    }
    
    private var backgroundColor: Color {
        switch buttonStyle {
        case .filled:
            return LoopzyColors.primary
        case .outlined:
            return Color.clear
        case .text:
            return Color.clear
        }
    }
    
    private var foregroundColor: Color {
        switch buttonStyle {
        case .filled:
            return Color.clear
        case .outlined:
            return LoopzyColors.primary
        case .text:
            return LoopzyColors.primary
        }
    }
    
    private var borderColor: Color {
        switch buttonStyle {
        case .filled:
            return Color.clear
        case .outlined:
            return LoopzyColors.primary
        case .text:
            return Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        buttonStyle == .outlined ? 1 : 0
    }
}

// MARK: - Follow/Unfollow Button
struct FollowButton: View {
    @Binding var isFollowing: Bool
    let action: () -> Void
    var size: Size = .medium
    
    enum Size {
        case small
        case medium
        case large
        
        var height: CGFloat {
            switch self {
            case .small: return 32
            case .medium: return 36
            case .large: return 44
            }
        }
        
        var fontSize: CGFloat {
            switch self {
            case .small: return 12
            case .medium: return 14
            case .large: return 16
            }
        }
        
        var padding: CGFloat {
            switch self {
            case .small: return 12
            case .medium: return 16
            case .large: return 20
            }
        }
    }
    
    var body: some View {
        Button(action: {
            action()
            isFollowing.toggle()
        }) {
            Text(isFollowing ? "Following" : "Follow")
                .font(LoopzyTypography.Component.button)
                .foregroundColor(isFollowing ? LoopzyColors.textPrimary : LoopzyColors.textTertiary)
                .padding(.horizontal, size.padding)
                .frame(height: size.height)
                .background(
                    RoundedRectangle(cornerRadius: LoopzyRadius.Component.button)
                        .fill(isFollowing ? LoopzyColors.surface : LoopzyColors.primary)
                )
        }
    }
}

// MARK: - Video Interaction Buttons
struct VideoActionButton: View {
    let icon: String
    let count: String?
    let isActive: Bool
    let action: () -> Void
    var size: CGFloat = 44
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: LoopzySpacing.Gap.minimal) {
                ZStack {
                    Circle()
                        .fill(LoopzyColors.primary)
                        .frame(width: size, height: size)
                    
                    Image(systemName: icon)
                        .font(.system(size: size * 0.45, weight: .medium))
                        .foregroundColor(isActive ? LoopzyColors.primary : LoopzyColors.primary)
                }
                
                if let count = count {
                    Text(count)
                        .font(LoopzyTypography.Label.small)
                        .foregroundColor(LoopzyColors.textPrimary)
                        .shadow(color: LoopzyColors.textTertiary, radius: 1, x: 0, y: 1)
                }
            }
        }
    }
}

// MARK: - Floating Action Button (Record Button)
struct RecordButton: View {
    let action: () -> Void
    var isRecording: Bool = false
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // Outer ring
                RoundedRectangle(cornerRadius: LoopzyRadius.medium)
                    .stroke(LoopzyColors.primary, lineWidth: 4)
                    .frame(width: 60, height: 44)
                
                // Inner content
                RoundedRectangle(cornerRadius: LoopzyRadius.small)
                    .fill(isRecording ? LoopzyColors.error : LoopzyColors.primary)
                    .frame(width: 52, height: 36)
                    .overlay(
                        Image(systemName: isRecording ? "stop.fill" : "plus")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(LoopzyColors.primary)
                    )
            }
        }
        .scaleEffect(isRecording ? 1.1 : 1.0)
        .animation(.easeInOut(duration: Animation.short), value: isRecording)
    }
}

// MARK: - Navigation Buttons
struct BackButton: View {
    let action: () -> Void
    var style: Style = .dark
    
    enum Style {
        case dark
        case light
        case transparent
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(foregroundColor)
                .frame(width: 44, height: 44)
                .background(backgroundColor)
                .clipShape(Circle())
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .dark: return .white
        case .light: return .black
        case .transparent: return .white
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .dark: return .black.opacity(0.5)
        case .light: return .white.opacity(0.9)
        case .transparent: return .clear
        }
    }
}

struct CloseButton: View {
    let action: () -> Void
    var style: BackButton.Style = .dark
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(style == .light ? .black : .white)
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(style == .light ? .white.opacity(0.9) : .black.opacity(0.5))
                )
        }
    }
}

// MARK: - Icon Buttons
struct IconButton: View {
    let icon: String
    let action: () -> Void
    var size: CGFloat = 44
    var iconSize: CGFloat = 20
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .white
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: iconSize, weight: .medium))
                .foregroundColor(foregroundColor)
                .frame(width: size, height: size)
                .background(
                    Circle()
                        .fill(backgroundColor)
                )
        }
    }
}

// MARK: - Share Button
struct ShareButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrowshape.turn.up.right.fill")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(
                    Circle()
                        .fill(.black.opacity(0.3))
                )
        }
    }
}
