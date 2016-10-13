//
//  AppDelegate.swift
//  ComicList
//
//  Created by Guillermo Gonzalez on 29/09/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        print("Realm configuration: ")
        print(Realm.Configuration.defaultConfiguration.description)

        
        
        let window = UIWindow(frame: UIScreen.main.bounds)

        coordinator = AppCoordinator(window: window)
        coordinator?.start()

        // Obtener el path de Realm para debbug
        
        
        return true
    }
}

