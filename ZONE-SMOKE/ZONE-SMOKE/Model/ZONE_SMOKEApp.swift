//
//  ZONE_SMOKEApp.swift
//  ZONE-SMOKE
//
//  Created by Даниил Арсентьев on 18.04.2022.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

@main
struct ZONE_SMOKEApp: App {
    var body: some Scene {
        WindowGroup {
           // Home()
           // BottomTAB()
            LaunchScreen()
        }
    }
}
