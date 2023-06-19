//
//  SceneDelegate.swift
//  testscene
//
//  Created by Guillaume CARELLI on 26/09/2022.
//

import UIKit
import Capacitor

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //guard let _ = (scene as? UIWindowScene) else { return }
        
        if let url = connectionOptions.urlContexts.first?.url ?? connectionOptions.userActivities.first?.webpageURL  {
            print("SceneDelegate - scene - willConnectTo - url: \(url)")
            
            //DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //    let result = ApplicationDelegateProxy.shared.application(UIApplication.shared, open: url)
            //    print("SceneDelegate - scene - willConnectTo - result: \(result)")
            //}
            
            let result = ApplicationDelegateProxy.shared.application(UIApplication.shared, open: url)
            print("SceneDelegate - scene - willConnectTo - result: \(result)")
        }
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>){
        
        if scene.session.configuration.name == "Default Configuration" {
            let url = URLContexts.first?.url
            print("SceneDelegate - scene - openURLContexts - url: \(String(describing: url))")
            
            let result = ApplicationDelegateProxy.shared.application(UIApplication.shared, open: url!)
            
            print("SceneDelegate - scene - openURLContexts - result: \(result)")
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        
        if scene.session.configuration.name == "Default Configuration" {
            let result = ApplicationDelegateProxy.shared.application(UIApplication.shared, continue: userActivity, restorationHandler: { restoration in
                print("SceneDelegate - scene - userActivity - restorationHandler: \(String(describing: restoration))")
            })
            
            print("SceneDelegate - scene - userActivity - result: \(result)")
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

