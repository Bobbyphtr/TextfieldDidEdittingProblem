//
//  AppDelegate.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        FirebaseApp.configure()
//        Messaging.messaging().delegate = self
//
//        let notifService =  NotificationService.init(application: application, gcmKey: gcmMessageIDKey)
//        notifService.requestNotificationAuthorization()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationCon = UINavigationController.init()
        appCoordinator = AppCoordinator(navCon: navigationCon)
        appCoordinator!.start()
        
        window!.rootViewController = navigationCon
        window!.makeKeyAndVisible()
        
//        configureGlobalFontStyle()
//        configureGlobalStyle()
//        DropDown.startListeningToKeyboard()
        return true
    }


}

