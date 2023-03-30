import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /*
     NOTE:
     In order to capture screenshots of views after they have animated (e.g DonutChartView) I needed to remove the
     standard SwiftUI entry point (SUICompanionAppApp) and replace it with an old-skool AppDelegate entry point.

     This allows ScreenshotableView to actually replace the main UI on screen and so trigger the onAppear event
     */

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainView = MainView()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIHostingController(rootView: mainView)
        window?.makeKeyAndVisible()

        return true
    }
}
