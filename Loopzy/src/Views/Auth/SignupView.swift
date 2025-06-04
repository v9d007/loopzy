//
//  SignupView.swift
//  Loopzy
//
//  Created by Vinod Kumar Singh on 27/05/25.
//


// AuthViews.swift
// Loopzy - Authentication Views

import SwiftUI

// MARK: - Signup View
struct SignupView: View {
    @EnvironmentObject private var router: AppRouter
    @EnvironmentObject private var coordinator: AppCoordinator
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var dateOfBirth = Date()
    
    @State private var isLoading = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var agreedToTerms = false
    @State private var currentStep = 1
    
    private let totalSteps = 3
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        Image(systemName: "infinity")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.purple)
                        
                        Text("Join Loopzy")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Create your account and enjoy the world of entertainment")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    
                    // Progress indicator
                    ProgressView(value: Double(currentStep), total: Double(totalSteps))
                        .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                        .padding(.horizontal)
                    
                    Text("Step \(currentStep) of \(totalSteps)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    // Form content based on current step
                    Group {
                        switch currentStep {
                        case 1:
                            basicInfoStep
                        case 2:
                            accountDetailsStep
                        case 3:
                            verificationStep
                        default:
                            basicInfoStep
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer(minLength: 20)
                }
            }
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        if currentStep > 1 {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                currentStep -= 1
                            }
                        } else {
                            router.goBack()
                        }
                    }
                    .foregroundColor(.purple)
                }
            }
            .alert("Error", isPresented: $showError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    // MARK: - Step 1: Basic Information
    private var basicInfoStep: some View {
        VStack(spacing: 20) {
            Text("Let's start with the basics")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 16) {
                CustomTextField(
                    placeholder: "Full Name",
                    text: $fullName,
                    style: .outlined
                )
                
                CustomTextField(
                    placeholder: "Email",
                    text: $email,
                    keyboardType: .emailAddress,
                    style: .outlined
                )
                
                CustomTextField(
                    placeholder: "Phone Number",
                    text: $phoneNumber,
                    keyboardType: .phonePad,
                    style: .outlined
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Date of Birth")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                    
                    DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
            }
            
            PrimaryButton(
                title: "Continue",
                action: {
                    validateAndContinueStep1()
                },
                isEnabled: !fullName.isEmpty && isValidEmail(email) && !phoneNumber.isEmpty,
                isLoading: isLoading
            )
            .padding(.top, 16)
        }
    }
    
    // MARK: - Step 2: Account Details
    private var accountDetailsStep: some View {
        VStack(spacing: 20) {
            Text("Create your account")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 16) {
                UsernameInputField(username: $username)
                
                CustomTextField(
                    placeholder: "Password",
                    text: $password,
                    isSecure: true,
                    style: .outlined
                )
                
                CustomTextField(
                    placeholder: "Confirm Password",
                    text: $confirmPassword,
                    isSecure: true,
                    style: .outlined
                )
                
                // Password requirements
                VStack(alignment: .leading, spacing: 4) {
                    Text("Password must contain:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    PasswordRequirementRow(
                        text: "At least 8 characters",
                        isValid: password.count >= 8
                    )
                    
                    PasswordRequirementRow(
                        text: "At least one uppercase letter",
                        isValid: password.range(of: "[A-Z]", options: .regularExpression) != nil
                    )
                    
                    PasswordRequirementRow(
                        text: "At least one number",
                        isValid: password.range(of: "[0-9]", options: .regularExpression) != nil
                    )
                    
                    PasswordRequirementRow(
                        text: "Passwords match",
                        isValid: !password.isEmpty && password == confirmPassword
                    )
                }
                .padding(.horizontal, 4)
            }
            
            PrimaryButton(
                title: "Continue",
                action: {
                    validateAndContinueStep2()
                },
                isEnabled: isValidPassword() && password == confirmPassword && !username.isEmpty,
                isLoading: isLoading
            )
            .padding(.top, 16)
        }
    }
    
    // MARK: - Step 3: Verification & Terms
    private var verificationStep: some View {
        VStack(spacing: 20) {
            Text("Almost done!")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 16) {
                Text("We'll send a verification code to:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(email)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.purple)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.purple.opacity(0.1))
                    )
                
                // Terms and conditions
                VStack(spacing: 12) {
                    HStack(alignment: .top, spacing: 12) {
                        Button(action: {
                            agreedToTerms.toggle()
                        }) {
                            Image(systemName: agreedToTerms ? "checkmark.square.fill" : "square")
                                .font(.system(size: 20))
                                .foregroundColor(agreedToTerms ? .purple : .gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("I agree to the Terms of Service and Privacy Policy")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            
                            HStack(spacing: 8) {
                                Button("Terms of Service") {
                                    // Open terms
                                }
                                .font(.system(size: 12))
                                .foregroundColor(.purple)
                                
                                Text("•")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Button("Privacy Policy") {
                                    // Open privacy policy
                                }
                                .font(.system(size: 12))
                                .foregroundColor(.purple)
                            }
                        }
                        
                        Spacer()
                    }
                }
                .padding(.vertical, 16)
            }
            
            PrimaryButton(
                title: "Create Account",
                action: {
                    createAccount()
                },
                isEnabled: agreedToTerms,
                isLoading: isLoading
            )
            .padding(.top, 16)
        }
    }
    
    // MARK: - Helper Methods
    private func validateAndContinueStep1() {
        guard !fullName.isEmpty,
              isValidEmail(email),
              !phoneNumber.isEmpty else {
            showError(message: "Please fill in all required fields")
            return
        }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            currentStep = 2
        }
    }
    
    private func validateAndContinueStep2() {
        guard !username.isEmpty,
              isValidPassword(),
              password == confirmPassword else {
            showError(message: "Please ensure all fields are valid")
            return
        }
        
        withAnimation(.easeInOut(duration: 0.3)) {
            currentStep = 3
        }
    }
    
    private func createAccount() {
        isLoading = true
        
        // Simulate account creation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            
            // For demo purposes, automatically sign in
            withAnimation {
                coordinator.isAuthenticated = true
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword() -> Bool {
        return password.count >= 8 &&
               password.range(of: "[A-Z]", options: .regularExpression) != nil &&
               password.range(of: "[0-9]", options: .regularExpression) != nil
    }
    
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
}

// MARK: - Password Requirement Row
struct PasswordRequirementRow: View {
    let text: String
    let isValid: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: isValid ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 12))
                .foregroundColor(isValid ? .green : .gray)
            
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(isValid ? .green : .gray)
            
            Spacer()
        }
    }
}
