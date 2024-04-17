//
//  FloatingAddButton.swift
//  Saal_Task
//
//  Created by belal medhat on 17/04/2024.
//

import SwiftUI

struct FloatingAddButton: View {
    var onAddButtonTap: () -> Void

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.onAddButtonTap()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    }
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
    FloatingAddButton(onAddButtonTap: {})
}
