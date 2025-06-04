import SwiftUI

// MARK: - Remove manual color declarations, use auto-generated ones from Assets.xcassets
// The auto-generated file already provides:
// - Color.loopzyPrimary
// - Color.loopzySecondary
// - Color.loopzyTextInverse
// - etc.

// MARK: - Keep only the adaptive color functions and LoopzyColors struct
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

// MARK: - Color Combinations (Reference auto-generated colors)
struct LoopzyColors {
    // MARK: - Primary Palette (Use auto-generated colors)
    static let primary = Color.loopzyPrimary
    static let secondary = Color.loopzySecondary
    static let accent = Color.loopzyAccent
    
    // MARK: - Background Palette (Custom adaptive colors)
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
    
    // MARK: - Use auto-generated colors
    static let textInverse = Color.loopzyTextInverse    
    static let overlay = Color.loopzyOverlay            
    static let overlayLight = Color.loopzyOverlayLight  
    
    // MARK: - Interactive States
    static let interactive = Color.loopzyInteractive           
    static let interactivePressed = Color.loopzyInteractivePressed  
    static let interactiveDisabled = Color.loopzyInteractiveDisabled 
    
    // MARK: - Status Colors
    static let success = Color.loopzySuccess    
    static let warning = Color.loopzyWarning    
    static let error = Color.loopzyError        
    static let info = Color.loopzyInfo          
    
    // MARK: - Gradients (Use auto-generated colors)
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

// SOLUTION 2: ALTERNATIVE - DISABLE AUTO-GENERATION (NOT RECOMMENDED)
/*
If you want to keep manual declarations:
1. Select your color assets in Assets.xcassets
2. In Attributes Inspector, uncheck "Provides Namespace"
3. Clean build folder and rebuild

But Solution 1 is better because auto-generated colors are more efficient.
*/

// WHAT THE AUTO-GENERATED FILE PROVIDES:

/*
✅ Color.loopzyPrimary
✅ Color.loopzySecondary
✅ Color.loopzyAccent
✅ Color.loopzyBackground
✅ Color.loopzySurface
✅ Color.loopzyCard
✅ Color.loopzyTextPrimary
✅ Color.loopzyTextSecondary
✅ Color.loopzyTextTertiary
✅ Color.loopzyTextInverse
✅ Color.loopzySuccess
✅ Color.loopzyWarning
✅ Color.loopzyError
✅ Color.loopzyInfo
✅ Color.loopzyInteractive
✅ Color.loopzyInteractivePressed
✅ Color.loopzyInteractiveDisabled
✅ Color.loopzyGradientStart
✅ Color.loopzyGradientEnd
✅ Color.loopzyLike
✅ Color.loopzyShare
✅ Color.loopzyComment
✅ Color.loopzyOverlay
✅ Color.loopzyOverlayLight
*/

// UPDATED COMPONENT USAGE:

// Your components can now use either:
// 1. Direct auto-generated colors: Color.loopzyPrimary
// 2. LoopzyColors combinations: LoopzyColors.primary

// Example in PrimaryButton:
/*
struct PrimaryButton: View {
    var body: some View {
        Button("Test") {}
            .foregroundColor(.loopzyTextInverse)    // Direct auto-generated
            .background(LoopzyColors.primary)       // Or via LoopzyColors
    }
}
*/

// BENEFITS OF AUTO-GENERATED APPROACH:

/*
✅ No duplicate declarations
✅ Automatic light/dark mode support from Assets.xcassets
✅ Type-safe color access
✅ Better performance
✅ Xcode tooling integration
✅ No manual Color("ColorName") calls needed
*/
