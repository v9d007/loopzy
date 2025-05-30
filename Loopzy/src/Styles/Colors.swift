import SwiftUI

// MARK: - Color Extensions
extension Color {
    // MARK: - Brand Colors
    static let loopzyPrimary = Color("LoopzyPrimary")
    static let loopzySecondary = Color("LoopzySecondary")
    static let loopzyAccent = Color("LoopzyAccent")
    
    // MARK: - UI Colors
    static let loopzyBackground = Color("LoopzyBackground")
    static let loopzySurface = Color("LoopzySurface")
    static let loopzyCard = Color("LoopzyCard")
    
    // MARK: - Text Colors
    static let loopzyTextPrimary = Color("LoopzyTextPrimary")
    static let loopzyTextSecondary = Color("LoopzyTextSecondary")
    static let loopzyTextTertiary = Color("LoopzyTextTertiary")
    static let loopzyTextInverse = Color("LoopzyTextInverse")
    
    // MARK: - Status Colors
    static let loopzySuccess = Color("LoopzySuccess")
    static let loopzyWarning = Color("LoopzyWarning")
    static let loopzyError = Color("LoopzyError")
    static let loopzyInfo = Color("LoopzyInfo")
    
    // MARK: - Interactive Colors
    static let loopzyInteractive = Color("LoopzyInteractive")
    static let loopzyInteractivePressed = Color("LoopzyInteractivePressed")
    static let loopzyInteractiveDisabled = Color("LoopzyInteractiveDisabled")
    
    // MARK: - Gradient Colors
    static let loopzyGradientStart = Color("LoopzyGradientStart")
    static let loopzyGradientEnd = Color("LoopzyGradientEnd")
    
    // MARK: - Social Media Colors
    static let loopzyLike = Color("LoopzyLike")
    static let loopzyShare = Color("LoopzyShare")
    static let loopzyComment = Color("LoopzyComment")
    
    // MARK: - Overlay Colors
    static let loopzyOverlay = Color("LoopzyOverlay")
    static let loopzyOverlayLight = Color("LoopzyOverlayLight")
}

// MARK: - Color Scheme Support
extension Color {
    static func adaptive(light: Color, dark: Color) -> Color {
        return Color(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(dark)
            default:
                return UIColor(light)
            }
        })
    }
}

// MARK: - Common Color Combinations
struct LoopzyColors {
    // MARK: - Primary Palette
    static let primary = Color.loopzyPrimary
    static let secondary = Color.loopzySecondary
    static let accent = Color.loopzyAccent
    
    // MARK: - Background Palette
    static let background = Color.adaptive(
        light: Color.white,
        dark: Color.black
    )
    
    static let surface = Color.adaptive(
        light: Color.gray.opacity(0.05),
        dark: Color.gray.opacity(0.1)
    )
    
    static let card = Color.adaptive(
        light: Color.white,
        dark: Color.gray.opacity(0.15)
    )
    
    // MARK: - Text Palette
    static let textPrimary = Color.adaptive(
        light: Color.black,
        dark: Color.white
    )
    
    static let textSecondary = Color.adaptive(
        light: Color.gray,
        dark: Color.gray.opacity(0.8)
    )
    
    static let textTertiary = Color.adaptive(
        light: Color.gray.opacity(0.6),
        dark: Color.gray.opacity(0.6)
    )
    
    // MARK: - Interactive States
    static let interactive = Color.loopzyPrimary
    static let interactivePressed = Color.loopzyPrimary.opacity(0.8)
    static let interactiveDisabled = Color.gray.opacity(0.3)
    
    // MARK: - Status Colors
    static let success = Color.green
    static let warning = Color.orange
    static let error = Color.red
    static let info = Color.blue
    
    // MARK: - Gradients
    static let primaryGradient = LinearGradient(
        colors: [Color.loopzyGradientStart, Color.loopzyGradientEnd],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let backgroundGradient = LinearGradient(
        colors: [Color.black, Color.black.opacity(0.8)],
        startPoint: .top,
        endPoint: .bottom
    )
    
    // MARK: - Video Player Colors
    static let playerBackground = Color.black
    static let playerControls = Color.white.opacity(0.8)
    static let playerProgress = Color.loopzyPrimary
}

// MARK: - Usage Examples and Documentation
/*
 Usage Examples:
 
 // Using direct colors
 Text("Hello")
     .foregroundColor(.loopzyTextPrimary)
     .background(.loopzySurface)
 
 // Using color combinations
 Button("Action") { }
     .foregroundColor(LoopzyColors.textPrimary)
     .background(LoopzyColors.primary)
 
 // Using gradients
 Rectangle()
     .fill(LoopzyColors.primaryGradient)
 
 // Using adaptive colors
 VStack {
     Text("Content")
 }
 .background(LoopzyColors.background)
 
 Color Asset Configuration in Assets.xcassets:
 - Create a Color Set named "LoopzyPrimary"
 - Set Light Appearance: Purple (#8B5CF6)
 - Set Dark Appearance: Purple (#A78BFA)
 - Repeat for all brand colors
 */
