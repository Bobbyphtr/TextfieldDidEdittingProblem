//
//  TransactionContainerViewModel.swift
//  
//
//  Created by BobbyPhtr on 29/03/21.
//

import Foundation
import RxSwift
import RxCocoa

class TransactionContainerViewModel {
    
    weak var coordinator : TransactionFlow?
    
//    var authApi : AuthService!
    
    init(coordinator : TransactionFlow) {
        self.coordinator = coordinator
//        self.authApi = authService
    }
    
//    let userData = LocalStorageManager.userData
    private let disposeBag = DisposeBag()
    
    let saldoRupiCasObservable = PublishSubject<String?>()
//
//    func featureIsNotAvailable(){
//        coordinator?.showDialog(title: "Maaf Terjadi Kesalahan", message: "Fitur belum tersedia.") { (action) in
//            self.coordinator?.goBackToHome()
//        }
//    }
//
//    func logOut(){
//        LocalStorageManager.userData = nil
//        coordinator?.goToLogin()
//    }
    
//    func getSaldo() {
//        guard userData != nil else {
//            coordinator?.showDialog(title: "Perhatian", message: "Token akun anda tidak valid, silahkan melakukan login kembali.") { (_) in
//                self.logOut()
//            }
//            return
//        }
//
//        authApi?.getUserAccount(nomorTelp: (userData?.handphone)!)
//            .do(onError: { [weak self] (err) in
//                self?.coordinator?.showSystemErrorAlert(message: err.localizedDescription)
//            })
//            .subscribe(onNext: { [weak self] response in
//
//                switch response.getStatus {
//                case .invalidToken:
//                    // back to login
//                    self?.coordinator?.showDialog(title: "Token Tidak Valid", message: "Silahkan melakukan login ulang kembali.") { (action) in
//                        self?.coordinator?.goToLogin()
//                    }
//                    break
//                case .success:
//                    let userData = LocalUserData(handphone: response.data!.handphone,
//                                                 fullname: response.data!.fullname,
//                                                 email: response.data!.email,
//                                                 accountType: response.data!.accountType,
//                                                 accountTypeDesc: response.data!.accountTypeDesc,
//                                                 accountTypeLimit: response.data!.accountTypeLimit,
//                                                 saldo: response.data!.saldo,
//                                                 statusUpgrade: response.data!.statusUpgrade,
//                                                 statusTutupAkun: response.data!.statusTutupAkun)
//                    LocalStorageManager.userData = userData
//                    self?.saldoRupiCasObservable.onNext(userData.saldo)
//                    break
//                default:
//                    self?.coordinator?.showSystemErrorAlertWithStatusCode(statusCode: response.statusCode!, message: response.message!)
//                }
//            })
//            .disposed(by: disposeBag)
//    }
       
}
