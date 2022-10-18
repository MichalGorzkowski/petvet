//
//  SignUpViewModel.swift
//  PetVet3
//
//  Created by Michał Gorzkowski on 31/05/2022.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var fullname = ""
    @Published var password = ""
    
    // VALIDATION
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
        "^([a-zA-Z0-9@*#]{8,15})$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    var isSignUpComplete: Bool {
        if !isPasswordValid() ||
            !isEmailValid() {
            return false
        }
        return true
    }
    
    // VALIDATION PROMPT STRINGS
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Wprowadź poprawny adres email."
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Musi zawierać od 8 do 15 znaków."
        }
    }
    
    func cleanAfterSignUp() {
        email = ""
        username = ""
        fullname = ""
        password = ""
    }
}
