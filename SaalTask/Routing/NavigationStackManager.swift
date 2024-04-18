//
//  NavigationStackManager.swift
//  SaalTask
//
//  Created by belal medhat on 18/04/2024.
//

import Foundation
import SwiftUI
class NavigatorAppState: ObservableObject {
    @Published var path = NavigationPath()
    func popToRoot() {
        path = NavigationPath()
    }
    func popFromStack() {
        path.removeLast()
    }
    func pushToStack<T: Hashable>(_ value: T) {
        path.append(value)
    }
}
