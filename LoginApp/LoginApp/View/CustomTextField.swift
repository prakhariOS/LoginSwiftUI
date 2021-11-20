//
//  CustomTextField.swift
//  LoginApp
//
//  Created by prakhar gupta on 19/11/21.
//

import SwiftUI

struct CustomTextField: View
{
	var image: String
	var hint: String
	var isSecureText: Bool = false
    var prompt: String

	@State var visible = false
	@State var isTapped = false
	@Binding var text: String

    var body: some View
    {
		VStack(alignment: .leading, spacing: 4, content:
		{
			HStack(spacing: 15)
			{
				Image(self.image)
					.foregroundColor(.gray)

				TextField("", text: $text)
				{ (status) in
					//it will fire when textfield is clicked.
					if status
					{
						withAnimation(.easeInOut.speed(1.5))
						{
							isTapped = true
						}
					}
				}
				onCommit:
				{
					if text == ""
					{
						withAnimation(.easeInOut.speed(1.5))
						{
							isTapped = false
						}
					}
				}

				if self.isSecureText
				{
					// Trailing button
					Button(action: {
						self.visible.toggle()
					}, label:
						{
							Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
								.foregroundColor(.gray)
						})
				}
			}
			.padding(.top, isTapped ? 15 : 0)
			.background(
				Text(hint)
					.padding(.horizontal, isTapped ? 8 : 24)
					.background(Color.white)
					.scaleEffect(isTapped ? 0.7 : 1, anchor: .leading)
					.offset(y: isTapped ? -26 : 0)
					.foregroundColor(.gray)

				,alignment: .leading
			)
			.padding(.horizontal)
		})
		.frame(height: 50)
		.background(
			RoundedRectangle(cornerRadius: 5)
				.strokeBorder(self.isTapped ? Color(red: 115 / 255, green: 61 / 255, blue: 71 / 255) :Color.gray, lineWidth: 1)
		)
		Text(prompt)
		.frame(maxWidth: .infinity, alignment: .leading)
		.fixedSize(horizontal: false, vertical: true)
		.font(.caption)
		.foregroundColor(.red)
    }
}
