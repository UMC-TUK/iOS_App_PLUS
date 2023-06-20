//
//  AppDelegate.swift
//  LoginSampleNaver
//
//  Created by 우주대스타 on 2023-06-20.
//

import UIKit
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.registerForRemoteNotifications()
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        instance?.isNaverAppOauthEnable = true //네이버앱 로그인 설정
        instance?.isInAppOauthEnable = true //사파리 로그인 설정

        instance?.serviceUrlScheme = "naverlogin" //URL Scheme
        instance?.consumerKey = "rokyjAcneSne499JeTUe" //클라이언트 아이디
        instance?.consumerSecret = "horBOrOxDA" //시크릿 아이디
        instance?.appName = "UMC_WEEK10" //앱이름
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
            return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

