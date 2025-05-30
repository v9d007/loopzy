//
//  ForgotPasswordView.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject private var router: AppRouter
    
    @State private var email = ""
    @State private var isLoading = false
    @State private var showSuccess = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var resetMethod: ResetMethod = .email
    
    enum ResetMethod: String, CaseIterable {
        case email = "Email"
        case phone = "Phone"
        
        var icon: String {
            switch self {
            case .email: return "envelope.fill"
            case .phone: return "phone.fill"
            }
        }
        
        var placeholder: String {
            switch self {
            case .email: return "Enter your email"
            case .phone: return "Enter your phone number"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            content
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ScrollView {
            VStack(spacing: LoopzySpacing.Screen.sectionSpacing) {
                headerSection
                resetMethodSection
                inputSection
                additionalOptionsSection
                Spacer()
            }
            .horizontalPaddingMD()
        }
        .navigationTitle("Reset Password")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    router.goBack()
                }
                .foregroundColor(LoopzyColors.primary)
            }
        }
        .alert("Success", isPresented: $showSuccess) {
            Button("OK") {
                router.goBack()
            }
        } message: {
            Text("Reset code sent successfully! Check your \(resetMethod.rawValue.lowercased()) for further instructions.")
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
    
    @ViewBuilder
    private var headerSection: some View {
        VStack(spacing: LoopzySpacing.md) {
            Image(systemName: "lock.rotation")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(LoopzyColors.primary)
            
            Text("Reset Password")
                .font(LoopzyTypography.Title.large)
                .fontWeight(.bold)
            
            Text("Don't worry! We'll help you reset your password and get back to creating amazing content.")
                .font(LoopzyTypography.Body.medium)
                .foregroundColor(LoopzyColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, LoopzySpacing.Screen.verticalPadding)
    }
    
    @ViewBuilder
    private var resetMethodSection: some View {
        VStack(spacing: LoopzySpacing.lg) {
            Text("How would you like to reset your password?")
                .font(LoopzyTypography.Headline.small)
                .multilineTextAlignment(.center)
            
            resetMethodButtons
        }
    }
    
    @ViewBuilder
    private var resetMethodButtons: some View {
        HStack(spacing: LoopzySpacing.md) {
            ForEach(ResetMethod.allCases, id: \.rawValue) { method in
                resetMethodButton(for: method)
            }
        }
    }
    
    @ViewBuilder
    private func resetMethodButton(for method: ResetMethod) -> some View {
        Button(action: {
            resetMethod = method
            email = "" // Clear previous input
        }) {
            VStack(spacing: LoopzySpacing.Gap.medium) {
                Image(systemName: method.icon)
                    .font(.system(size: 24))
                    .foregroundColor(resetMethod == method ? LoopzyColors.primary : LoopzyColors.primary)
                
                Text(method.rawValue)
                    .font(LoopzyTypography.Label.large)
                    .fontWeight(.medium)
                    .foregroundColor(resetMethod == method ? LoopzyColors.textTertiary : LoopzyColors.primary)
            }
            .frame(maxWidth: .infinity)
            .paddingLG()
            .background(
                RoundedRectangle(cornerRadius: LoopzyRadius.large)
                    .fill(resetMethod == method ? LoopzyColors.primary : LoopzyColors.primary.opacity(0.1))
            )
        }
    }
    
    @ViewBuilder
    private var inputSection: some View {
        VStack(spacing: LoopzySpacing.TextField.betweenFields) {
            CustomTextField(
                placeholder: resetMethod.placeholder,
                text: $email,
                keyboardType: resetMethod == .email ? .emailAddress : .phonePad
            )
            
            PrimaryButton(
                title: "Send Reset Code",
                action: sendResetCode,
                isEnabled: !email.isEmpty,
                isLoading: isLoading
            )
        }
    }
    
    @ViewBuilder
    private var additionalOptionsSection: some View {
        VStack(spacing: LoopzySpacing.md) {
            Text("Still having trouble?")
                .font(LoopzyTypography.Body.medium)
                .foregroundColor(LoopzyColors.textSecondary)
            
            Button("Contact Support") {
                // Handle contact support
            }
            .font(LoopzyTypography.Body.large)
            .fontWeight(.medium)
            .foregroundColor(LoopzyColors.primary)
            
            Button("Remember your password?") {
                router.goBack()
            }
            .font(LoopzyTypography.Body.medium)
            .foregroundColor(LoopzyColors.textSecondary)
        }
    }
    
    // MARK: - Helper Methods
    private func sendResetCode() {
        guard !email.isEmpty else {
            showError(message: "Please enter your \(resetMethod.rawValue.lowercased())")
            return
        }
        
        if resetMethod == .email && !isValidEmail(email) {
            showError(message: "Please enter a valid email address")
            return
        }
        
        isLoading = true
        
        // Simulate sending reset code
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            showSuccess = true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
}
