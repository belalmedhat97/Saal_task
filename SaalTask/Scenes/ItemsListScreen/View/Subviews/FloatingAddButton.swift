//
//  FloatingAddButton.swift
//  SaalTask
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI

struct FloatingAddButton: View {
    var onAddTap: () -> Void

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {self.onAddTap()}, label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    FloatingAddButton(onAddTap: {})
}
