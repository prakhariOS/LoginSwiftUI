//
//  Login.swift
//  LoginApp
//
//  Created by prakhar gupta on 19/11/21.
//

import SwiftUI

struct Login: View
{
	/// ViewModel
	@ObservedObject var viewModel = LoginViewModel()

    var body: some View
    {
		VStack(alignment: .center)
		{
			LogoImage()
			VStack(spacing: 6)
			{
				CustomTextField(image: "user", hint: "Username", prompt: viewModel.userNamePrompt, text: $viewModel.username)
				CustomTextField(image: "password", hint: "Password", isSecureText: true, prompt: viewModel.passwordPrompt, text: $viewModel.password)
				CustomTextField(image: "email", hint: "Email address", prompt: viewModel.emailPrompt, text: $viewModel.email)
			}
			.padding(.horizontal)
			.padding(.top)
			VStack(spacing: 30)
			{
				ForgotPassword()
				LoginButton()
				SignUpButton()
			}
			.padding(.horizontal, 20)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.white)
    }
}

struct Login_Previews: PreviewProvider
{
    static var previews: some View
    {
        Login()
    }
}


struct LogoImage: View
{
	var body: some View
	{
		Image("logo")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(width: 150, height: 100)
			.clipped()
			.padding(.bottom, 60)
	}
}

struct ForgotPassword: View
{
	var body: some View
	{
		HStack
		{
			Spacer()
			Button(action: {})
			{
				Text("Forgot password")
					.fontWeight(.regular)
					.foregroundColor(Color(red: 191 / 255, green: 155 / 255, blue: 155 / 255))
			}
		}
		.padding(.top, 24)
	}
}

struct LoginButton: View
{
	var body: some View
	{
		Button(action: {})
		{
			Text("LOGIN")
				.fontWeight(.heavy)
				.foregroundColor(.white)
				.padding(.vertical)
				.frame(width: UIScreen.main.bounds.width - 50)
		}
		.background(Color(red: 115 / 255, green: 61 / 255, blue: 71 / 255))
		.cornerRadius(10)
		.padding(.top, 24)
	}
}

struct SignUpButton: View
{
	var body: some View
	{
		HStack(spacing: 8)
		{
			Text("Don't have an account?")
				.fontWeight(.regular)
				.foregroundColor(.gray)

			Button(action: {})
			{
				Text("sign up")
					.fontWeight(.regular)
					.foregroundColor(Color(red: 191 / 255, green: 155 / 255, blue: 155 / 255))
			}
		}
	}
}
