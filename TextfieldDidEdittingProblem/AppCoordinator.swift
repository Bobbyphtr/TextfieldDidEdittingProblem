//
//  AppCoordinator.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import Foundation
import UIKit

protocol AppCoodinatorFlowDelegate : AppFLow {
    func goToProblem()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator Start")
        // Need to check if user already login or this is a first time launch.
        goToProblem()
        
    }
    
    fileprivate static func removeAllChildren(coordinator : Coordinator){
        while coordinator.children.count > 0 {
            for child in coordinator.children {
                removeAllChildren(coordinator: child)
                child.children.removeAll()
            }
            coordinator.children.removeAll()
        }
        
        
    }
    
    
    deinit {
        print("deinit : AppCoordinator")
    }
}

extension AppCoordinator : AppCoodinatorFlowDelegate {
    
    func goToProblem() {
        AppCoordinator.removeAllChildren(coordinator: self)
        let coordinator = TransactionCoordinator.init(navigationController: navigationController, title: Service.pln.rawValue)
        coordinator.start()
        coordinator.parentCoordinator = self
        children.append(coordinator)
        
        // MARK: HERE
        /// You could change the service to `Service.pln` and `Service.pdam`
        coordinator.goToPPOB(service: Service.pln)
    }
}
