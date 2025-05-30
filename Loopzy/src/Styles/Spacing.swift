//
//  LoopzySpacing.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//


import SwiftUI

// MARK: - Spacing Constants
struct LoopzySpacing {
    // MARK: - Base Spacing Scale (8pt grid system)
    static let xxxs: CGFloat = 2    // 2pt
    static let xxs: CGFloat = 4     // 4pt
    static let xs: CGFloat = 8      // 8pt
    static let sm: CGFloat = 12     // 12pt
    static let md: CGFloat = 16     // 16pt
    static let lg: CGFloat = 20     // 20pt
    static let xl: CGFloat = 24     // 24pt
    static let xxl: CGFloat = 32    // 32pt
    static let xxxl: CGFloat = 40   // 40pt
    static let xxxxl: CGFloat = 48  // 48pt
    
    // MARK: - Semantic Spacing
    struct Padding {
        static let minimal = LoopzySpacing.xxs      // 4pt
        static let small = LoopzySpacing.xs         // 8pt
        static let medium = LoopzySpacing.md        // 16pt
        static let large = LoopzySpacing.xl         // 24pt
        static let extraLarge = LoopzySpacing.xxxl  // 40pt
    }
    
    struct Margin {
        static let tight = LoopzySpacing.xs         // 8pt
        static let normal = LoopzySpacing.md        // 16pt
        static let comfortable = LoopzySpacing.xl   // 24pt
        static let spacious = LoopzySpacing.xxxl    // 40pt
    }
    
    struct Gap {
        static let minimal = LoopzySpacing.xxs      // 4pt
        static let small = LoopzySpacing.xs         // 8pt
        static let medium = LoopzySpacing.sm        // 12pt
        static let large = LoopzySpacing.md         // 16pt
        static let extraLarge = LoopzySpacing.lg    // 20pt
    }
    
    // MARK: - Component Specific Spacing
    struct Button {
        static let horizontalPadding = LoopzySpacing.md     // 16pt
        static let verticalPadding = LoopzySpacing.sm       // 12pt
        static let iconSpacing = LoopzySpacing.xs           // 8pt
        static let betweenButtons = LoopzySpacing.sm        // 12pt
    }
    
    struct Card {
        static let padding = LoopzySpacing.md               // 16pt
        static let margin = LoopzySpacing.md                // 16pt
        static let betweenCards = LoopzySpacing.lg          // 20pt
        static let cornerRadius = LoopzySpacing.sm          // 12pt
    }
    
    struct TextField {
        static let horizontalPadding = LoopzySpacing.md     // 16pt
        static let verticalPadding = LoopzySpacing.sm       // 12pt
        static let betweenFields = LoopzySpacing.md         // 16pt
        static let cornerRadius = LoopzySpacing.xs          // 8pt
    }
    
    struct List {
        static let itemPadding = LoopzySpacing.md           // 16pt
        static let betweenItems = LoopzySpacing.xs          // 8pt
        static let sectionSpacing = LoopzySpacing.xl        // 24pt
    }
    
    // MARK: - Screen Layout Spacing
    struct Screen {
        static let horizontalPadding = LoopzySpacing.md     // 16pt
        static let verticalPadding = LoopzySpacing.lg       // 20pt
        static let sectionSpacing = LoopzySpacing.xxxl      // 40pt
        static let headerSpacing = LoopzySpacing.xl         // 24pt
    }
    
    struct TabBar {
        static let height: CGFloat = 83                     // Standard tab bar height
        static let iconSize: CGFloat = 24                   // Tab bar icon size
        static let padding = LoopzySpacing.xs               // 8pt
    }
    
    struct NavigationBar {
        static let height: CGFloat = 44                     // Standard nav bar height
        static let titleSpacing = LoopzySpacing.md          // 16pt
        static let buttonSpacing = LoopzySpacing.md         // 16pt
    }
    
    // MARK: - Video Player Specific
    struct VideoPlayer {
        static let controlsPadding = LoopzySpacing.md       // 16pt
        static let overlayPadding = LoopzySpacing.lg        // 20pt
        static let buttonSpacing = LoopzySpacing.xl         // 24pt
        static let progressBarHeight: CGFloat = 4           // Progress bar height
        static let seekBarPadding = LoopzySpacing.md        // 16pt
    }
    
    // MARK: - Social Features Spacing
    struct Social {
        static let likeButtonSpacing = LoopzySpacing.md     // 16pt
        static let commentSpacing = LoopzySpacing.xs        // 8pt
        static let userInfoSpacing = LoopzySpacing.sm       // 12pt
        static let avatarSpacing = LoopzySpacing.xs         // 8pt
    }
    
    // MARK: - Grid System
    struct Grid {
        static let columnSpacing = LoopzySpacing.xs         // 8pt
        static let rowSpacing = LoopzySpacing.xs            // 8pt
        static let sectionSpacing = LoopzySpacing.xl        // 24pt
    }
}

// MARK: - Border Radius Scale
struct LoopzyRadius {
    static let none: CGFloat = 0
    static let small: CGFloat = 4
    static let medium: CGFloat = 8
    static let large: CGFloat = 12
    static let extraLarge: CGFloat = 16
    static let round: CGFloat = 50   // For circular elements
    
    // Component specific radius
    struct Component {
        static let button = LoopzyRadius.medium         // 8pt
        static let card = LoopzyRadius.large           // 12pt
        static let textField = LoopzyRadius.medium     // 8pt
        static let modal = LoopzyRadius.extraLarge     // 16pt
    }
}

// MARK: - Shadow and Elevation
struct LoopzyShadow {
    static let none = 0
    static let small = 2
    static let medium = 4
    static let large = 8
    static let extraLarge = 16
    
    struct Component {
        static let card = LoopzyShadow.small
        static let button = LoopzyShadow.small
        static let modal = LoopzyShadow.large
        static let floatingButton = LoopzyShadow.medium
    }
}

// MARK: - View Modifiers for Spacing
extension View {
    // MARK: - Padding Modifiers
    func paddingXS() -> some View {
        self.padding(LoopzySpacing.xs)
    }
    
    func paddingSM() -> some View {
        self.padding(LoopzySpacing.sm)
    }
    
    func paddingMD() -> some View {
        self.padding(LoopzySpacing.md)
    }
    
    func paddingLG() -> some View {
        self.padding(LoopzySpacing.lg)
    }
    
    func paddingXL() -> some View {
        self.padding(LoopzySpacing.xl)
    }
    
    // MARK: - Horizontal Padding
    func horizontalPaddingMD() -> some View {
        self.padding(.horizontal, LoopzySpacing.md)
    }
    
    func horizontalPaddingLG() -> some View {
        self.padding(.horizontal, LoopzySpacing.lg)
    }
    
    // MARK: - Vertical Padding
    func verticalPaddingMD() -> some View {
        self.padding(.vertical, LoopzySpacing.md)
    }
    
    func verticalPaddingLG() -> some View {
        self.padding(.vertical, LoopzySpacing.lg)
    }
    
    // MARK: - Corner Radius Modifiers
    func cornerRadiusSmall() -> some View {
        self.cornerRadius(LoopzyRadius.small)
    }
    
    func cornerRadiusMedium() -> some View {
        self.cornerRadius(LoopzyRadius.medium)
    }
    
    func cornerRadiusLarge() -> some View {
        self.cornerRadius(LoopzyRadius.large)
    }
    
    // MARK: - Shadow Modifiers
    func shadowSmall() -> some View {
        self.shadow(radius: CGFloat(LoopzyShadow.small))
    }
    
    func shadowMedium() -> some View {
        self.shadow(radius: CGFloat(LoopzyShadow.medium))
    }
    
    func shadowLarge() -> some View {
        self.shadow(radius: CGFloat(LoopzyShadow.large))
    }
    
    // MARK: - Component Specific Modifiers
    func buttonStyle() -> some View {
        self
            .padding(.horizontal, LoopzySpacing.Button.horizontalPadding)
            .padding(.vertical, LoopzySpacing.Button.verticalPadding)
            .cornerRadius(LoopzyRadius.Component.button)
    }
    
    func cardStyle() -> some View {
        self
            .padding(LoopzySpacing.Card.padding)
            .background(LoopzyColors.card)
            .cornerRadius(LoopzyRadius.Component.card)
            .shadow(radius: CGFloat(LoopzyShadow.Component.card))
    }
    
    func textFieldStyle() -> some View {
        self
            .padding(.horizontal, LoopzySpacing.TextField.horizontalPadding)
            .padding(.vertical, LoopzySpacing.TextField.verticalPadding)
            .background(LoopzyColors.surface)
            .cornerRadius(LoopzyRadius.Component.textField)
    }
}

// MARK: - Spacer Extensions
extension Spacer {
    static func height(_ value: CGFloat) -> some View {
        Spacer()
            .frame(height: value)
    }
    
    static func width(_ value: CGFloat) -> some View {
        Spacer()
            .frame(width: value)
    }
    
    // Predefined spacers
    static var xs: some View { height(LoopzySpacing.xs) }
    static var sm: some View { height(LoopzySpacing.sm) }
    static var md: some View { height(LoopzySpacing.md) }
    static var lg: some View { height(LoopzySpacing.lg) }
    static var xl: some View { height(LoopzySpacing.xl) }
}


struct Animation {
    static let short: TimeInterval = 0.2
    static let medium: TimeInterval = 0.3
    static let long: TimeInterval = 0.5
}

// MARK: - Usage Examples and Documentation
/*
 Usage Examples:
 
 // Using spacing constants
 VStack(spacing: LoopzySpacing.md) {
     Text("Title")
     Text("Subtitle")
 }
 .padding(LoopzySpacing.Screen.horizontalPadding)
 
 // Using semantic spacing
 Button("Action") { }
     .padding(.horizontal, LoopzySpacing.Button.horizontalPadding)
     .padding(.vertical, LoopzySpacing.Button.verticalPadding)
 
 // Using view modifiers
 Text("Content")
     .paddingMD()
     .cardStyle()
 
 // Using predefined spacers
 VStack {
     Text("First")
     Spacer.md
     Text("Second")
 }
 
 Design System Guidelines:
 - Use 8pt grid system for consistency
 - Prefer semantic spacing over raw values
 - Use view modifiers for common patterns
 - Maintain consistent spacing across similar components
 */
