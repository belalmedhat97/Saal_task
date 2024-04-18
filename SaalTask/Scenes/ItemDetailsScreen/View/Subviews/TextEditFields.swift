//
//  PlaceholderTextField.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import SwiftUI

struct PlaceholderTextField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(placeholder)").font(.caption)
            TextField(text, text: $text).font(.footnote).textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding().background(Color(.white)).clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    PlaceholderTextField(placeholder: "placeholder", text: .constant("textField"))
}
