//
//  CustomTextField.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//

import SwiftUI

// MARK: - Text Field Components
struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var style: Style = .outlined
    
    enum Style {
        case outlined
        case underlined
        case filled
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: LoopzySpacing.Gap.small) {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                        .keyboardType(keyboardType)
                }
            }
            .font(LoopzyTypography.Body.large)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .overlay(borderOverlay)
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch style {
        case .outlined, .filled: return LoopzySpacing.TextField.horizontalPadding
        case .underlined: return 0
        }
    }
    
    private var verticalPadding: CGFloat {
        switch style {
        case .outlined, .filled: return LoopzySpacing.TextField.verticalPadding
        case .underlined: return LoopzySpacing.TextField.verticalPadding
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .outlined: return Color.clear
        case .filled: return LoopzyColors.surface
        case .underlined: return Color.clear
        }
    }
    
    @ViewBuilder
    private var borderOverlay: some View {
        switch style {
        case .outlined:
            RoundedRectangle(cornerRadius: LoopzyRadius.Component.textField)
                .stroke(LoopzyColors.textSecondary.opacity(0.3), lineWidth: 1)
        case .underlined:
            VStack {
                Spacer()
                Rectangle()
                    .fill(LoopzyColors.textSecondary.opacity(0.3))
                    .frame(height: 1)
            }
        case .filled:
            EmptyView()
        }
    }
}

// MARK: - Search Bar Component
struct CustomSearchBar: View {
    @Binding var searchText: String
    var placeholder: String = "Search"
    let onSearchSubmit: () -> Void
    let onCancel: (() -> Void)?
    @FocusState private var isFocused: Bool
    
    init(searchText: Binding<String>, 
         placeholder: String = "Search", 
         onSearchSubmit: @escaping () -> Void, 
         onCancel: (() -> Void)? = nil) {
        self._searchText = searchText
        self.placeholder = placeholder
        self.onSearchSubmit = onSearchSubmit
        self.onCancel = onCancel
    }
    
    var body: some View {
        HStack(spacing: LoopzySpacing.Gap.medium) {
            // Search field container
            HStack(spacing: LoopzySpacing.Gap.medium) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(LoopzyColors.textSecondary)
                    .font(LoopzyTypography.Body.large)
                
                TextField(placeholder, text: $searchText)
                    .focused($isFocused)
                    .font(LoopzyTypography.Body.large)
                    .onSubmit {
                        onSearchSubmit()
                    }
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(LoopzyColors.textSecondary)
                            .font(LoopzyTypography.Body.large)
                    }
                }
            }
            .padding(.horizontal, LoopzySpacing.TextField.horizontalPadding)
            .padding(.vertical, LoopzySpacing.TextField.verticalPadding)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(LoopzyColors.surface)
            )
            
            // Cancel button (appears when focused)
            if isFocused && onCancel != nil {
                Button("Cancel") {
                    isFocused = false
                    onCancel?()
                }
                .font(LoopzyTypography.Body.large)
                .foregroundColor(LoopzyColors.primary)
            }
        }
    }
}

// MARK: - Comment Input Component
struct CommentInputView: View {
    @Binding var commentText: String
    let onSend: () -> Void
    let onEmojiTap: (() -> Void)?
    let onMentionTap: (() -> Void)?
    @FocusState private var isFocused: Bool
    
    init(commentText: Binding<String>, 
         onSend: @escaping () -> Void,
         onEmojiTap: (() -> Void)? = nil,
         onMentionTap: (() -> Void)? = nil) {
        self._commentText = commentText
        self.onSend = onSend
        self.onEmojiTap = onEmojiTap
        self.onMentionTap = onMentionTap
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Input row
            HStack(spacing: 12) {
                // Profile image placeholder
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    )
                
                // Input field
                HStack(spacing: 8) {
                    TextField("Add comment...", text: $commentText, axis: .vertical)
                        .focused($isFocused)
                        .font(.system(size: 16))
                        .lineLimit(1...4)
                    
                    // Action buttons
                    HStack(spacing: 16) {
                        if let onMentionTap = onMentionTap {
                            Button(action: onMentionTap) {
                                Image(systemName: "at")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                            }
                        }
                        
                        if let onEmojiTap = onEmojiTap {
                            Button(action: onEmojiTap) {
                                Image(systemName: "face.smiling")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    Capsule()
                        .fill(Color(white: 0.95))
                )
                
                // Send button
                Button(action: {
                    onSend()
                    commentText = ""
                    isFocused = false
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(commentText.isEmpty ? .gray : Color.loopzyPrimary)
                        .font(.system(size: 16))
                }
                .disabled(commentText.isEmpty)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
        }
    }
}

// MARK: - Username Input with Validation
struct UsernameInputField: View {
    @Binding var username: String
    @State private var isValid: Bool = true
    @State private var validationMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField("Username", text: $username)
                .font(.system(size: 16))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
                .onChange(of: username) { _, newValue in
                    validateUsername(newValue)
                }
            
            if !validationMessage.isEmpty {
                Text(validationMessage)
                    .font(.system(size: 12))
                    .foregroundColor(isValid ? .green : .red)
                    .padding(.horizontal, 4)
            }
        }
    }
    
    private var borderColor: Color {
        if username.isEmpty {
            return Color.gray.opacity(0.3)
        }
        return isValid ? .green : .red
    }
    
    private func validateUsername(_ value: String) {
        if value.isEmpty {
            validationMessage = ""
            isValid = true
            return
        }
        
        if value.count < 3 {
            validationMessage = "Username must be at least 3 characters"
            isValid = false
        } else if value.count > 20 {
            validationMessage = "Username must be less than 20 characters"
            isValid = false
        } else if !value.allSatisfy({ $0.isLetter || $0.isNumber || $0 == "_" || $0 == "." }) {
            validationMessage = "Username can only contain letters, numbers, underscore, and period"
            isValid = false
        } else {
            validationMessage = "Username is available"
            isValid = true
        }
    }
}

// MARK: - Phone Number Input
struct PhoneNumberInputField: View {
    @Binding var phoneNumber: String
    @State private var countryCode: String = "+1"
    
    var body: some View {
        HStack(spacing: 12) {
            // Country code picker
            Menu {
                Button("+1 (US)") { countryCode = "+1" }
                Button("+44 (UK)") { countryCode = "+44" }
                Button("+91 (IN)") { countryCode = "+91" }
                Button("+86 (CN)") { countryCode = "+86" }
                // Add more country codes as needed
            } label: {
                HStack {
                    Text(countryCode)
                        .font(.system(size: 16))
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12))
                }
                .foregroundColor(.black)
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            
            // Phone number field
            TextField("Phone number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .font(.system(size: 16))
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
}

// MARK: - OTP Input Field
struct OTPInputField: View {
    @Binding var otpText: String
    let numberOfFields: Int = 6
    @FocusState private var fieldFocus: Int?
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: Binding(
                    get: {
                        if otpText.count > index {
                            let startIndex = otpText.startIndex
                            let currentIndex = otpText.index(startIndex, offsetBy: index)
                            return String(otpText[currentIndex])
                        }
                        return ""
                    },
                    set: { newValue in
                        if newValue.count <= 1 {
                            updateOTP(at: index, with: newValue)
                        }
                    }
                ))
                .frame(width: 44, height: 44)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .font(.system(size: 20, weight: .medium))
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .focused($fieldFocus, equals: index)
                .onChange(of: otpText) { _, _ in
                    updateFocus()
                }
            }
        }
    }
    
    private func updateOTP(at index: Int, with value: String) {
        var newOTP = Array(otpText)
        
        // Ensure array is large enough
        while newOTP.count <= index {
            newOTP.append(" ")
        }
        
        if value.isEmpty {
            // Handle deletion
            if index < newOTP.count {
                newOTP[index] = " "
            }
        } else {
            // Handle input
            if index < newOTP.count {
                newOTP[index] = Character(value)
            }
        }
        
        otpText = String(newOTP).trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func updateFocus() {
        let nextIndex = otpText.count
        if nextIndex < numberOfFields {
            fieldFocus = nextIndex
        } else {
            fieldFocus = nil
        }
    }
}

// MARK: - Caption Input for Video Upload
struct VideoCaptionInput: View {
    @Binding var caption: String
    let maxCharacters: Int = 150
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Write a caption...")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
            
            TextField("", text: $caption, axis: .vertical)
                .font(.system(size: 16))
                .lineLimit(1...5)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(white: 0.98))
                )
                .onChange(of: caption) { _, newValue in
                    if newValue.count > maxCharacters {
                        caption = String(newValue.prefix(maxCharacters))
                    }
                }
            
            HStack {
                Spacer()
                Text("\(caption.count)/\(maxCharacters)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
}
