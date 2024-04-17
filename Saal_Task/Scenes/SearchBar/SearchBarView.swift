//
//  SearchBarView.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State var showClearButton: Bool = false
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .onChange(of: text) { _, newValue in
                    (showClearButton = newValue != "" ? true : false)
                }
            
            if showClearButton {
                Button(action: {
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .padding(.trailing, 8)
                }
            }

        }
    }
}

#Preview {
    SearchBarView(text: .constant("Search"))
}
