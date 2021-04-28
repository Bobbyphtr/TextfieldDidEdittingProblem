//
//  UINavigationControllerExtension.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import Foundation
import UIKit

extension UINavigationController {
    
    /*
     FIXME: Ini bisa berjalan jika push 1 view controller dan mendismiss sekali. Jika banyak aktivitas present dan dismiss sekaligus akan mengalami error, menyebabkan view controller ketiga tidak ke show.
     
     Ex. tunjukin loading screen, dismiss, tunjukinn error dialog, dismiss, pushviewcontroller.
     
     Perlu sistem queue view controller supaya bisa
    */
    /// Will dismiss every modally presented view controllers and push defined view controller.
    /// - Parameters:
    ///   - viewController: view controller  that will be pushed
    ///   - animated: do animation when view cotroller pushed.
    open func forcePushViewController(_ viewController: UIViewController, animated: Bool) {
        if presentingViewController == nil && presentedViewController == nil{
            self.pushViewController(viewController, animated: animated)
        } else{
            if presentingViewController != nil {
                presentingViewController!.dismiss(animated: animated) {
                   self.pushViewController(viewController, animated: animated)
               }
            }
            if presentedViewController != nil {
                presentedViewController!.dismiss(animated: animated) {
                   self.pushViewController(viewController, animated: animated)
               }
            }
             
        }
    }
    
    open func forcePresentViewController(_ viewController: UIViewController, animated: Bool, completion : (()->(Void))?) {
        if presentingViewController == nil && presentedViewController == nil{
            self.present(viewController, animated: animated, completion: completion)
        } else{
            if presentingViewController != nil {
                presentingViewController!.dismiss(animated: animated) {
                    self.present(viewController, animated: animated, completion: completion)
               }
            }
            if presentedViewController != nil {
                presentedViewController!.dismiss(animated: animated) {
                    self.present(viewController, animated: animated, completion: completion)
               }
            }
             
        }
    }
    
}
