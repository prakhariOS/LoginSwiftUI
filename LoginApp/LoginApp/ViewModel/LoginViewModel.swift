//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by prakhar gupta on 19/11/21.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject
{
	@Published var username = ""
	@Published var password = ""
	@Published var email = ""

//	private var isUsernameValidPublishes: AnyPublisher<Bool, Never>
//	{
//		$username
//			.debounce(for: 0.8, scheduler: RunLoop.main)
//			.removeDuplicates()
//			.map { $0.count >= 1 }
//			.eraseToAnyPublisher()
//	}
//
//		private var isemailValidPublishes: AnyPublisher<Bool, Never>
//	{
//		$email
//			.debounce(for: 0.8, scheduler: RunLoop.main)
//			.removeDuplicates()
//			.map { $0.count >= 1 }
//			.eraseToAnyPublisher()
//	}


	// MARK: - Validation Functions

    func isPasswordValid() -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}$")
        return passwordTest.evaluate(with: password)
    }
    func isEmailValid() -> Bool
    {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    func isUserName() -> Bool
    {

//        let uppercase = CharacterSet.uppercaseLetters
//		let allowedWhitespaces = CharacterSet.whitespaces
//        let uppercaseRange = self.username.rangeOfCharacter(from: uppercase)
//        let whiteSpaces = self.username.rangeOfCharacter(from: allowedWhitespaces)
//
//		return (uppercaseRange != nil) && (whiteSpaces != nil)

        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       ".*[^a-z0-9].*")
        return passwordTest.evaluate(with: username)
	}

    // MARK: - Validation Prompt Strings

	var userNamePrompt: String
    {
		if username.isEmpty
		{
            return "User name should not be empty"
		}
        else if isUserName()
        {
            return "Username should not have spaces and no upper case alphabet"
        }
        else
        {
			return ""
        }
    }
    var emailPrompt: String
    {
		if email.isEmpty
		{
            return "Email should not be empty"
		}
        else if !isEmailValid()
        {
            return "Enter a valid email address"
        }
        else
        {
			return ""
        }
    }

    var passwordPrompt: String
    {
		if password.isEmpty
		{
            return "Password should not be empty"
		}
        else if !isPasswordValid()
        {
			return "Should have 8 characters, 1 number, 1 upper case alphabet, 1 lower case alphabet"

        }
        else
        {
			return ""
        }
    }
}
