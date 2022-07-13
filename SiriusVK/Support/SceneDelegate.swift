//
//  SceneDelegate.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let mainVC = VKMainScreen()
        mainVC.manager = NetworkManager()
        
        window.rootViewController = UINavigationController(rootViewController: mainVC)
        window.makeKeyAndVisible()
        self.window = window
    }
}

