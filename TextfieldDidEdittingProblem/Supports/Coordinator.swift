//
//  Coordinator.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import Foundation
import UIKit

protocol AppFLow : AnyObject {
//    func showDialog(with image : UIImage, title : String, message : String, onOkAction : (()->Void)?)
//    func showDialog(title : String, message : String, onOkAction : ((UIAlertAction)->Void)?)
//    func showDialogWithActions(title : String, message : String, actions : [UIAlertAction])
//    func showSystemErrorAlert(message : String)
//    func showSystemErrorAlertWithStatusCode(statusCode : String, message : String)
//    func showLoadingScreen(message : String?)
//    func hideLoadingScreen()
}

protocol Coordinator : AppFLow {
    var parentCoordinator: Coordinator? { get set }
    
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

extension Coordinator{
    func childDidFinish(coordinator : Coordinator){
        for (index, child) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
            }
        }
    }
}
