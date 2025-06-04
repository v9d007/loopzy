//
//  AuthView.swift  
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var coordinator: AppCoordinator
    
    // Simulating login for demo purposes
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: LoopzySpacing.Screen.sectionSpacing) {
                logoSection
                loginForm
                actionButtons
                socialLoginSection
                Spacer()
            }
            .horizontalPaddingMD()
        }
        .background(LoopzyColors.background)
        .navigationBarHidden(true)
        .alert("Error", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
    
    @ViewBuilder
    private var logoSection: some View {
        VStack(spacing: LoopzySpacing.md) {
            Image(systemName: "infinity")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(LoopzyColors.primary)
            
            VStack(spacing: LoopzySpacing.Gap.small) {
                Text("Welcome to Loopzy")
                    .font(LoopzyTypography.Title.large)
                    .fontWeight(.bold)
                    .foregroundColor(LoopzyColors.textPrimary)
                
                Text("Create, share, and discover amazing content")
                    .font(LoopzyTypography.Body.medium)
                    .foregroundColor(LoopzyColors.textSecondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.top, LoopzySpacing.Screen.verticalPadding)
    }
    
    @ViewBuilder
    private var loginForm: some View {
        VStack(spacing: LoopzySpacing.TextField.betweenFields) {
            LoopzyTextField(
                placeholder: "Email",
                text: $email,
                keyboardType: .emailAddress
            )
            
            LoopzyTextField(
                placeholder: "Password",
                text: $password,
                isSecure: true
            )
        }
    }
    
    @ViewBuilder
    private var actionButtons: some View {
        VStack(spacing: LoopzySpacing.md) {
            PrimaryButton(
                title: "Sign In",
                action: signIn,
                isEnabled: !email.isEmpty && !password.isEmpty,
                isLoading: isLoading
            )
            
            HStack {
                Button("Forgot Password?") {
                    router.navigate(to: .auth(.forgotPassword))
                }
                .font(LoopzyTypography.Body.medium)
                .foregroundColor(LoopzyColors.primary)
                
                Spacer()
                
                Button("Sign Up") {
                    router.navigate(to: .auth(.signup))
                }
                .font(LoopzyTypography.Body.medium)
                .fontWeight(.semibold)
                .foregroundColor(LoopzyColors.primary)
            }
        }
    }
    
    @ViewBuilder
    private var socialLoginSection: some View {
        VStack(spacing: LoopzySpacing.md) {
            HStack {
                Rectangle()
                    .fill(LoopzyColors.textSecondary.opacity(0.3))
                    .frame(height: 1)
                
                Text("or")
                    .font(LoopzyTypography.Body.medium)
                    .foregroundColor(LoopzyColors.textSecondary)
                    .paddingMD()
                
                Rectangle()
                    .fill(LoopzyColors.textSecondary.opacity(0.3))
                    .frame(height: 1)
            }
            
            VStack(spacing: LoopzySpacing.Gap.medium) {
                SocialLoginButton(
                    title: "Continue with Apple",
                    icon: "apple.logo",
                    backgroundColor: LoopzyColors.textPrimary,
                    foregroundColor: LoopzyColors.textInverse
                ) {
                    // Handle Apple Sign In
                }
                
                SocialLoginButton(
                    title: "Continue with Google",
                    icon: "globe",
                    backgroundColor: LoopzyColors.surface,
                    foregroundColor: LoopzyColors.textPrimary
                ) {
                    // Handle Google Sign In
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    private func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            showError(message: "Please fill in all fields")
            return
        }
        
        guard isValidEmail(email) else {
            showError(message: "Please enter a valid email address")
            return
        }
        
        isLoading = true
        
        // Simulate login API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            
            // For demo purposes - normally you'd validate with server
            if email == "demo@loopzy.com" && password == "password" {
                withAnimation {
                    coordinator.isAuthenticated = true
                }
            } else {
                showError(message: "Invalid email or password")
            }
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

// MARK: - Social Login Button Component
struct SocialLoginButton: View {
    let title: String
    let icon: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: LoopzySpacing.Gap.medium) {
                Image(systemName: icon)
                    .font(LoopzyTypography.Body.large)
                
                Text(title)
                    .font(LoopzyTypography.Body.large)
                    .fontWeight(.medium)
            }
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, LoopzySpacing.Button.horizontalPadding)
            .padding(.vertical, LoopzySpacing.Button.verticalPadding)
            .background(backgroundColor)
            .cornerRadius(LoopzyRadius.Component.button)
            .overlay(
                RoundedRectangle(cornerRadius: LoopzyRadius.Component.button)
                    .stroke(LoopzyColors.textSecondary.opacity(0.3), lineWidth: 1)
            )
        }
    }
}

// MARK: - LoopzyTextField Component (if not already created)
struct LoopzyTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
            }
        }
        .font(LoopzyTypography.Body.large)
        .padding(.horizontal, LoopzySpacing.TextField.horizontalPadding)
        .padding(.vertical, LoopzySpacing.TextField.verticalPadding)
        .background(LoopzyColors.surface)
        .cornerRadius(LoopzyRadius.Component.textField)
        .overlay(
            RoundedRectangle(cornerRadius: LoopzyRadius.Component.textField)
                .stroke(LoopzyColors.textSecondary.opacity(0.3), lineWidth: 1)
        )
    }
}
