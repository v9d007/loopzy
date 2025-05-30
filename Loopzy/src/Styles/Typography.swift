//
//  LoopzyTypography.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 26/05/25.
//


import SwiftUI

// MARK: - Font Extensions
extension Font {
    // MARK: - Brand Font Family
    // Replace "Poppins" with your chosen font family
    static let loopzyFontFamily = "Poppins"
    
    // MARK: - Display Fonts (Large Titles)
    static let loopzyDisplayLarge = Font.custom(loopzyFontFamily, size: 57, relativeTo: .largeTitle)
    static let loopzyDisplayMedium = Font.custom(loopzyFontFamily, size: 45, relativeTo: .largeTitle)
    static let loopzyDisplaySmall = Font.custom(loopzyFontFamily, size: 36, relativeTo: .title)
    
    // MARK: - Headline Fonts
    static let loopzyHeadlineLarge = Font.custom(loopzyFontFamily, size: 32, relativeTo: .title)
    static let loopzyHeadlineMedium = Font.custom(loopzyFontFamily, size: 28, relativeTo: .title2)
    static let loopzyHeadlineSmall = Font.custom(loopzyFontFamily, size: 24, relativeTo: .title3)
    
    // MARK: - Title Fonts
    static let loopzyTitleLarge = Font.custom(loopzyFontFamily, size: 22, relativeTo: .title3)
    static let loopzyTitleMedium = Font.custom(loopzyFontFamily, size: 18, relativeTo: .headline)
    static let loopzyTitleSmall = Font.custom(loopzyFontFamily, size: 16, relativeTo: .subheadline)
    
    // MARK: - Body Fonts
    static let loopzyBodyLarge = Font.custom(loopzyFontFamily, size: 16, relativeTo: .body)
    static let loopzyBodyMedium = Font.custom(loopzyFontFamily, size: 14, relativeTo: .body)
    static let loopzyBodySmall = Font.custom(loopzyFontFamily, size: 12, relativeTo: .footnote)
    
    // MARK: - Label Fonts
    static let loopzyLabelLarge = Font.custom(loopzyFontFamily, size: 14, relativeTo: .callout)
    static let loopzyLabelMedium = Font.custom(loopzyFontFamily, size: 12, relativeTo: .caption)
    static let loopzyLabelSmall = Font.custom(loopzyFontFamily, size: 10, relativeTo: .caption2)
    
    // MARK: - Special Use Cases
    static let loopzyButton = Font.custom(loopzyFontFamily, size: 16, relativeTo: .body).weight(.semibold)
    static let loopzyCaption = Font.custom(loopzyFontFamily, size: 12, relativeTo: .caption)
    static let loopzyOverline = Font.custom(loopzyFontFamily, size: 10, relativeTo: .caption2).weight(.medium)
    
    // MARK: - Video/Content Specific
    static let loopzyVideoTitle = Font.custom(loopzyFontFamily, size: 16, relativeTo: .body).weight(.semibold)
    static let loopzyVideoDescription = Font.custom(loopzyFontFamily, size: 14, relativeTo: .body)
    static let loopzyUsername = Font.custom(loopzyFontFamily, size: 15, relativeTo: .body).weight(.semibold)
    static let loopzyTimestamp = Font.custom(loopzyFontFamily, size: 12, relativeTo: .caption)
}

// MARK: - Typography Scale
struct LoopzyTypography {
    // MARK: - Display Scale
    struct Display {
        static let large = Font.loopzyDisplayLarge
        static let medium = Font.loopzyDisplayMedium
        static let small = Font.loopzyDisplaySmall
    }
    
    // MARK: - Headline Scale
    struct Headline {
        static let large = Font.loopzyHeadlineLarge
        static let medium = Font.loopzyHeadlineMedium
        static let small = Font.loopzyHeadlineSmall
    }
    
    // MARK: - Title Scale
    struct Title {
        static let large = Font.loopzyTitleLarge
        static let medium = Font.loopzyTitleMedium
        static let small = Font.loopzyTitleSmall
    }
    
    // MARK: - Body Scale
    struct Body {
        static let large = Font.loopzyBodyLarge
        static let medium = Font.loopzyBodyMedium
        static let small = Font.loopzyBodySmall
    }
    
    // MARK: - Label Scale
    struct Label {
        static let large = Font.loopzyLabelLarge
        static let medium = Font.loopzyLabelMedium
        static let small = Font.loopzyLabelSmall
    }
    
    // MARK: - Component Specific
    struct Component {
        static let button = Font.loopzyButton
        static let caption = Font.loopzyCaption
        static let overline = Font.loopzyOverline
    }
    
    // MARK: - App Specific
    struct Content {
        static let videoTitle = Font.loopzyVideoTitle
        static let videoDescription = Font.loopzyVideoDescription
        static let username = Font.loopzyUsername
        static let timestamp = Font.loopzyTimestamp
    }
}

// MARK: - Text Style Modifiers
extension Text {
    // MARK: - Display Styles
    func displayLarge() -> Text {
        self.font(.loopzyDisplayLarge)
    }
    
    func displayMedium() -> Text {
        self.font(.loopzyDisplayMedium)
    }
    
    func displaySmall() -> Text {
        self.font(.loopzyDisplaySmall)
    }
    
    // MARK: - Headline Styles
    func headlineLarge() -> Text {
        self.font(.loopzyHeadlineLarge)
    }
    
    func headlineMedium() -> Text {
        self.font(.loopzyHeadlineMedium)
    }
    
    func headlineSmall() -> Text {
        self.font(.loopzyHeadlineSmall)
    }
    
    // MARK: - Title Styles
    func titleLarge() -> Text {
        self.font(.loopzyTitleLarge)
    }
    
    func titleMedium() -> Text {
        self.font(.loopzyTitleMedium)
    }
    
    func titleSmall() -> Text {
        self.font(.loopzyTitleSmall)
    }
    
    // MARK: - Body Styles
    func bodyLarge() -> Text {
        self.font(.loopzyBodyLarge)
    }
    
    func bodyMedium() -> Text {
        self.font(.loopzyBodyMedium)
    }
    
    func bodySmall() -> Text {
        self.font(.loopzyBodySmall)
    }
    
    // MARK: - Label Styles
    func labelLarge() -> Text {
        self.font(.loopzyLabelLarge)
    }
    
    func labelMedium() -> Text {
        self.font(.loopzyLabelMedium)
    }
    
    func labelSmall() -> Text {
        self.font(.loopzyLabelSmall)
    }
    
    // MARK: - Content Specific Styles
    func videoTitle() -> Text {
        self.font(.loopzyVideoTitle)
    }
    
    func videoDescription() -> Text {
        self.font(.loopzyVideoDescription)
    }
    
    func username() -> Text {
        self.font(.loopzyUsername)
    }
    
    func timestamp() -> Text {
        self.font(.loopzyTimestamp)
    }
}

// MARK: - View Modifiers for Typography
struct LoopzyTextStyle: ViewModifier {
    let font: Font
    let color: Color
    let weight: Font.Weight?
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .fontWeight(weight)
    }
}

extension View {
    func loopzyTextStyle(
        font: Font,
        color: Color = LoopzyColors.textPrimary,
        weight: Font.Weight? = nil
    ) -> some View {
        self.modifier(LoopzyTextStyle(font: font, color: color, weight: weight))
    }
}

// MARK: - Line Height and Letter Spacing
extension Text {
    func withLineSpacing(_ spacing: CGFloat) -> some View {
        self.lineSpacing(spacing)
    }
    
    func withKerning(_ kerning: CGFloat) -> some View {
        self.kerning(kerning)
    }
    
    func withTracking(_ tracking: CGFloat) -> some View {
        self.tracking(tracking)
    }
}

// MARK: - Usage Examples and Documentation
/*
 Usage Examples:
 
 // Using font extensions
 Text("Welcome to Loopzy")
     .font(.loopzyDisplayLarge)
 
 // Using typography scale
 Text("Video Title")
     .font(LoopzyTypography.Content.videoTitle)
 
 // Using text modifiers
 Text("Username")
     .username()
     .foregroundColor(.loopzyPrimary)
 
 // Using view modifiers
 Text("Custom Text")
     .loopzyTextStyle(
         font: LoopzyTypography.Body.large,
         color: LoopzyColors.textSecondary,
         weight: .medium
     )
 
 Font Installation Instructions:
 1. Add your font files (.ttf or .otf) to your Xcode project
 2. Add font files to your app target
 3. Update Info.plist with font names:
    <key>UIAppFonts</key>
    <array>
        <string>Poppins-Regular.ttf</string>
        <string>Poppins-Bold.ttf</string>
        <string>Poppins-SemiBold.ttf</string>
    </array>
 4. Update loopzyFontFamily constant with correct font name
 */