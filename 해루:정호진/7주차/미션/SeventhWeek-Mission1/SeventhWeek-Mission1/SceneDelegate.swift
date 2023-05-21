//
//  SceneDelegate.swift
//  SeventhWeek-Mission1
//
//  Created by 정호진 on 2023/05/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
                
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let info = load()
        if info.id != "" && info.pw != ""{
            let vc = storyboard.instantiateViewController(withIdentifier: "DoneLoginController") as! DoneLoginController
            let rootViewController = UINavigationController(rootViewController: vc)
            self.window = UIWindow(windowScene: scene)
            self.window?.rootViewController = rootViewController
            self.window?.makeKeyAndVisible()
        }
        else{
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let rootViewController = UINavigationController(rootViewController: vc)
            self.window = UIWindow(windowScene: scene)
            self.window?.rootViewController = rootViewController
            self.window?.makeKeyAndVisible()
        }
        
    }

    private func load() -> Info{
        guard let data = UserDefaults.standard.object(forKey: "myData") as? Data else {return Info(id: "", pw: "")}
        return try! JSONDecoder().decode(Info.self, from: data)
    }

}

