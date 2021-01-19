
import Foundation
import UIKit

struct AppConstants
{
    static let databaseName                           = ""
    
    static let auth_KEY = ""
    
    struct Reachability
    {
         static var IsConnection = false
    }

    static var ADMOB_REWARDED_ID = "ca-app-pub-3940256099942544/1712485313"
}


func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}

extension UIViewController {
    
    func pop_to_NavigateViews(vc:AnyClass, isAnimate:Bool)
    {
        if let ttcontroller = self.navigationController?.viewControllers
        {
            if ttcontroller.count != 0
            {
                for controller in self.navigationController!.viewControllers as Array
                {
                    if controller.isKind(of: vc) {
                        if isAnimate {
                            self.navigationController!.popToViewController(controller, animated: true)
                        }
                        else {
                            self.navigationController!.popToViewController(controller, animated: false)
                        }
                        break
                    }
                }
            }
        }

    }
}
