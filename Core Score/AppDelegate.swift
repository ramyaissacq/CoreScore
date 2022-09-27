//
//  AppDelegate.swift
//  Core Score
//
//  Created by Remya on 9/27/22.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        UNUserNotificationCenter.current().delegate = self
        prepareSendNotifications()
        
        application.registerForRemoteNotifications()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}


extension AppDelegate:UNUserNotificationCenterDelegate{
func prepareSendNotifications(){
    UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization(completionHandler: { (success) in
                    guard success else { return }
                    
                })
           
            default:
                break
            }
        }
    
}


private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
    // Request Authorization
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
        if let error = error {
            print("Request Authorization Failed (\(error), \(error.localizedDescription))")
        }

        completionHandler(success)
    }
}
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let id = response.notification.request.content.userInfo["id"] as? Int{
            if let topVC = UIApplication.getTopRootController() as? UITabBarController {
                if let navigation = topVC.children.first as? UINavigationController{
                    let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeCategoryViewController") as! HomeCategoryViewController
                    HomeCategoryViewController.matchID = id
                    vc.selectedMatch =  AppPreferences.getPinList().filter{$0.matchId == id}.first
                    vc.selectedCategory = .index
                    navigation.pushViewController(vc, animated: true)
                        
                    
                }
            }
            
        }
        

        completionHandler()
    }
}

// MARK: - Core Data stack
//extension AppDelegate{
//    
//
//       lazy var persistentContainer: NSPersistentContainer = {
//           /*
//            The persistent container for the application. This implementation
//            creates and returns a container, having loaded the store for the
//            application to it. This property is optional since there are legitimate
//            error conditions that could cause the creation of the store to fail.
//           */
//           let container = NSPersistentContainer(name: "Core_Score")
//           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//               if let error = error as NSError? {
//                   // Replace this implementation with code to handle the error appropriately.
//                   // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                    
//                   /*
//                    Typical reasons for an error here include:
//                    * The parent directory does not exist, cannot be created, or disallows writing.
//                    * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                    * The device is out of space.
//                    * The store could not be migrated to the current model version.
//                    Check the error message to determine what the actual problem was.
//                    */
//                   fatalError("Unresolved error \(error), \(error.userInfo)")
//               }
//           })
//           return container
//       }()
//
//       // MARK: - Core Data Saving support
//
//       func saveContext () {
//           let context = persistentContainer.viewContext
//           if context.hasChanges {
//               do {
//                   try context.save()
//               } catch {
//                   // Replace this implementation with code to handle the error appropriately.
//                   // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                   let nserror = error as NSError
//                   fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//               }
//           }
//       }
//
//   }
//
//}
