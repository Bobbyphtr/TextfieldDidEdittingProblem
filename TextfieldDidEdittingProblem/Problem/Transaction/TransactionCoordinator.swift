//
//  TransactionCoordinator.swift
//  
//
//  Created by BobbyPhtr on 09/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import MaterialComponents

protocol TransactionFlow : AppFLow {
    //    func showReceipt(receiptData : ReceiptDetailModel, viewModel : ReceiptViewModel)
    //    func showTransactionSummary(receiptData : ReceiptDetailModel, totalBayar : Int, service : Service )->Observable<Bool>
    //    func doTransaction(receiptData : ReceiptDetailModel, totalBayar : Int, service : Service, goToReceiptObservable : Observable<ReceiptViewModel>)
    //    func goToPin()->Observable<Bool>
    //    func goToLogin()
    //    func goBackToHome()
    
    func goToPPOB(service : Service)
    //    func goToServices()
}

class TransactionCoordinator : NSObject, Coordinator, UINavigationControllerDelegate {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var childNavigationController = UINavigationController()
    
    // MARK: STORYBOARD
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    // MARK: SERVICES
    //    var authApi : AuthService?
    let disposeBag = DisposeBag()
    
    //    var pembelianApi : PembelianService?
    //    var locationService : LocationService?
    
    // MARK: PROPERTIES
    let currentTransactionTitle : String?
    
    init(navigationController : UINavigationController, title : String){
        self.navigationController = navigationController
        //        self.authApi = authService
        self.currentTransactionTitle = title
    }
    
    func start() {
        print("Transaction Coordinator start")
        navigationController.delegate = self
        
        let vm = TransactionContainerViewModel.init(coordinator: self)
        let vc = TransactionContainerViewController.instantiate(from: storyboard)
        
        childNavigationController.navigationBar.isTranslucent = false
        childNavigationController.setNavigationBarHidden(true, animated: false)
        
        //        childNavigationController.viewControllers = [LoadingViewController.init(message: "Sedang Memuat...")]
        
        vc.viewModel = vm
        vc.title = currentTransactionTitle
        vc.childViewController = childNavigationController
        
        navigationController.setViewControllers([vc], animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //        if viewController is HomeViewController {
        //            parentCoordinator?.childDidFinish(coordinator: self)
        //            // Return the delegation to HomeCoordinator
        //            navigationController.delegate = parentCoordinator as! HomeCoordinator
        //            children.removeAll()
        //        }
    }
    
    deinit {
        print("deinit TransactionCoordinator")
    }
}

extension TransactionCoordinator : TransactionFlow {
    
    //    func goBackToHome(){
    //        parentCoordinator?.childDidFinish(coordinator: self)
    //        children.removeAll()
    //        navigationController.popViewController(animated: true)
    //    }
    //
    //    func goToLogin(){
    //        let home = parentCoordinator as! HomeFlow
    //        parentCoordinator?.childDidFinish(coordinator: self)
    //        children.removeAll()
    //        home.goToLogin()
    //    }
    
    func goToPPOB(service : Service) {
        
        let ppobCoordinator = PPOBCoordinator.init(navigationController: childNavigationController, service: service)
        switch service {
        case .pulsaData, .eMoney, .tokenPln:
            //            ppobCoordinator.pembelianApi = PembelianServiceAPI()
            //            ppobCoordinator.locationService = LocationService()
            break
        case .pln, .pdam, .telkom, .tvkabel, .bpjsKesehatan, .pascabayar, .finance:
            //            ppobCoordinator.locationService = LocationService()
            break
        }
        ppobCoordinator.start()
        ppobCoordinator.parentCoordinator = self
        children.append(ppobCoordinator)
    }
    
    //    func goToServices() {
    //        //
    //    }
    //
    //    func doTransaction(receiptData : ReceiptDetailModel, totalBayar : Int, service : Service, goToReceiptObservable : Observable<ReceiptViewModel>) {
    //        // Show summary
    //        showTransactionSummary(receiptData: receiptData, totalBayar: totalBayar, service: service)
    //            .subscribe(onNext: { [unowned self] isBayarPressed in
    //                if isBayarPressed {
    //                    self.goToPin()
    //                        .subscribe(onNext: { [unowned self] isPassed in
    //                            if isPassed {
    //                                // Pop the PIN and show Receipt afterwards
    //                                self.navigationController.popViewController(animated: true)
    //                                goToReceiptObservable
    //                                    .subscribe(onNext: { vm in
    //                                        self.showReceipt(receiptData: receiptData, viewModel: vm)
    //                                    })
    //                                    .disposed(by: disposeBag)
    //                            }
    //                        })
    //                        .disposed(by: self.disposeBag)
    //                }
    //            }).disposed(by: self.disposeBag)
    //    }
    //
    //    func goToPin()->Observable<Bool> {
    //        let authCoordinator = AuthCoordinator.init(navCon: navigationController)
    //        children.append(authCoordinator)
    //        authCoordinator.parentCoordinator = self
    //        return authCoordinator.goToPIN(pinMode: .normal, serverObservable: nil, previousPinObservable: nil)
    //            .map { return $0.count > 0 }
    //    }
    //
    //    /// Show Receipt
    //    /// - Parameters:
    //    ///   - receiptData: receipt detail model for detail transaksi
    //    ///   - viewModel: ReceiptViewModel for other informations
    //    func showReceipt(receiptData : ReceiptDetailModel, viewModel : ReceiptViewModel){
    //        let vm = viewModel
    //
    //        let vc = ReceiptViewController.instantiate(from: storyboard)
    //
    //        vm.onClose.subscribe(onNext: { isClosing in
    //            self.navigationController.dismiss(animated: true, completion: nil)
    //        }).disposed(by: disposeBag)
    //        vc.viewModel = vm
    //        navigationController.forcePresentViewController(vc, animated: true, completion: nil)
    //    }
    //
    //    func showTransactionSummary(receiptData : ReceiptDetailModel, totalBayar : Int, service : Service )->Observable<Bool> {
    //        let vc = TransactionSummaryViewController.instantiate(from: storyboard)
    //        vc.viewModel = TransactionSummaryViewController.ViewModel.init(receiptData: receiptData, service: service, totalBayar: totalBayar)
    //        let bottomSheet = MDCBottomSheetController(contentViewController: vc)
    //        navigationController.forcePresentViewController(bottomSheet, animated: true, completion: nil)
    //        return vc.onBayarPressedObservable.asObservable()
    //    }
}
