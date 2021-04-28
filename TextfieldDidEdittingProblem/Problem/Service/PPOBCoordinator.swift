//
//  PPOBCoordinator.swift
//
//
//  Created by BobbyPhtr on 29/03/21.
//

import Foundation
import UIKit
import MaterialComponents.MaterialBottomSheet
import RxSwift
import RxCocoa
import ContactsUI

protocol PPOBFlow : AppFLow {
    func goToFullScreenPicker(selectionList : [SelectionObject], pickerTitle : String, searchPlaceholder : String, pickerListTitle : String?)->Observable<SelectionObject>
    func startService(service : Service)
    func showBottomSheetPicker(selectionList : [SelectionObject])->Observable<SelectionObject>
//    func showContactPicker(delegate : CNContactPickerDelegate)
//    func doTransaction(receiptData : ReceiptDetailModel, totalBayar : Int, goToReceiptObservable : Observable<ReceiptViewModel>)
//    func goToRoot()
}

class PPOBCoordinator : NSObject, Coordinator, UINavigationControllerDelegate {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    // MARK: SERVICES
//    var authApi : AuthService?
//    var pembelianApi : PembelianService?
//    var locationService : LocationService?
    
    // MARK: PROPERTES
    var currentService : Service!
    let disposeBag = DisposeBag()
    
//    init(navigationController : UINavigationController, authService : AuthService, service : Service) {
//        self.authApi = authService
//        self.navigationController = navigationController
//        self.currentService = service
//    }
    
    init(navigationController : UINavigationController, service : Service) {
        self.navigationController = navigationController
        self.currentService = service
    }
    
    func start() {
        print("PPOB Coordinator start")
        navigationController.delegate = self
        startService(service: currentService)
    }
    
    // React To Backs
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
//        if fromViewController is PINViewController {
//            children.removeAll { (coordinator) -> Bool in
//                return coordinator is AuthCoordinator
//            }
//        }
    }
    
    deinit {
        print("PPOB Coordinator deinit")
    }
    
}

extension PPOBCoordinator : PPOBFlow {
    
//    func doTransaction(receiptData : ReceiptDetailModel, totalBayar : Int, goToReceiptObservable : Observable<ReceiptViewModel>) {
//        let parent = parentCoordinator as! TransactionFlow
//        parent.doTransaction(receiptData: receiptData, totalBayar: totalBayar, service: currentService, goToReceiptObservable: goToReceiptObservable)
//    }
//
//    func goToRoot() {
//        navigationController.popToRootViewController(animated: true)
//    }
//
//    func showContactPicker(delegate : CNContactPickerDelegate) {
//        let vc = CNContactPickerViewController.init()
//        vc.delegate = delegate
//        navigationController.forcePresentViewController(vc, animated: true, completion: nil)
//    }
    
    func showBottomSheetPicker(selectionList : [SelectionObject])->Observable<SelectionObject> {
        return Observable.create { [weak self] (observer) -> Disposable in
            let vc = SelectProductViewController.init(selectionList: selectionList) { (selectionObject) in
                observer.onNext(selectionObject)
            }
            let bottomSheet = MDCBottomSheetController(contentViewController: vc)
            self?.navigationController.forcePresentViewController(bottomSheet, animated: true, completion: nil)
            return Disposables.create()
        }
    }
    
    func goToFullScreenPicker(selectionList : [SelectionObject], pickerTitle : String, searchPlaceholder : String, pickerListTitle : String?)->Observable<SelectionObject> {
        let vc = FullScreenDataPickerController.init(selectionList: selectionList, pickerTitle: pickerTitle, searchPlaceholder: searchPlaceholder, listTitle: pickerListTitle)
        navigationController.forcePresentViewController(vc, animated: true, completion: nil)
        return vc.productChoosenObservable
    }
    
    
    func startService(service : Service) {
        // Menggunakan SetViewControllers untuk menumpul LoadingViewController yang sudah sebagai root dari container navigation controllernya
        switch service {
//        case .pulsaData:
//            let childVc = PulsaDataViewController.init()
//            childVc.viewModel = PulsaDataViewModel(coordinator: self, pembelianService: pembelianApi!, locationService: locationService!)
//            navigationController.setViewControllers([childVc], animated: false)
//            break
//        case .tokenPln:
//            let childVc =
//                TokenPlnViewController.init()
//            childVc.viewModel = TokenPlnViewModel(coordinator: self, api: pembelianApi!, locationService: locationService!)
//            navigationController.setViewControllers([childVc], animated: false)
//            break
        case .pln:
            let childVc =
                PlnPostpaidViewController.init()
            childVc.viewModel = PlnPostPaidViewModel.init(coordinator: self)
            navigationController.setViewControllers([childVc], animated: false)
        case .pdam:
            let childVc =
                PdamViewController.init()
            childVc.viewModel = PdamViewModel.init(coordinator: self)
            navigationController.setViewControllers([childVc], animated: false)
        default:
            break
        }
    }
    
}
