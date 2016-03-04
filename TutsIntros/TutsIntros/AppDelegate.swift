
import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    
    var appController: TVApplicationController?
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let appControllerContext = TVApplicationControllerContext()
        
        let javascriptUrl = NSURL(string: "http://localhost:9001/js/application.js")
        
        appControllerContext.javaScriptApplicationURL = javascriptUrl!
        
        if let options = launchOptions {
            for (kind, value) in options {
                if let kindStr = kind as? String {
                    appControllerContext.launchOptions[kindStr] = value
                }
            }
        }
        
        self.appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        
        return true
    }
    
}

