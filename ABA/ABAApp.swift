//
//  ABAApp.swift
//  ABA
//
//  Created by MacBook on 6/9/25.
//

import SwiftUI

@main
struct ABAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegrate.self) private var appdelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegrate: NSObject, UIApplicationDelegate {
    static var orientationLook = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegrate.orientationLook
    }
}
