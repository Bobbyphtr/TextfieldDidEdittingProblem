//
//  PlnPostpaidViewController.swift
//  
//
//  Created by BobbyPhtr on 26/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import UIKit
import MaterialComponents.MDCButton
import MaterialComponents.MDCFilledTextField
import RxSwift
import RxCocoa

class PlnPostpaidViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel : PlnPostPaidViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var produkListrikDropDown: MDCFilledTextField!
    @IBOutlet weak var idPelangganField: MDCFilledTextField!
    @IBOutlet weak var cekTagihanButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureViews()
        configureBindings()
        
        produkListrikDropDown.delegate = self
    }
    
    private func configureBindings(){
        
//        produkListrikDropDown.rx.controlEvent(.editingDidBegin)
////            .debounce(.milliseconds(150), scheduler: MainScheduler.instance)
//            .subscribe(onNext:{ [unowned self] in
////                self.dismissKeyboard()
//                print("produk Listrik Field did begin")
//
//            })
//            .disposed(by: disposeBag)
        
        viewModel.currentProdukListBehaviorSubject
            .map{$0?.rawValue}
            .subscribe(onNext: { [unowned self] in
                if produkListrikDropDown.text != $0 {
                    produkListrikDropDown.text = $0
                }
            })
            .disposed(by: disposeBag)
        
        idPelangganField.rx.text
            .bind(to: viewModel.currentIdPelangganBehaviorSubject)
            .disposed(by: disposeBag)
            
    }
    
    // For the dropdown menu
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == produkListrikDropDown {
            viewModel.showProdukListrik()
            return false
        }
        return true
    }


    private func configureViews(){
//        produkListrikDropDown.dropdownStyle()
        produkListrikDropDown.label.text = "Produk Listrik"
        produkListrikDropDown.inputView = UIView.init(frame: CGRect.zero)
        
        idPelangganField.label.text = "No. Meter / ID Pelanggan"
//        idPelangganField.outlineStyle()
        idPelangganField.keyboardType = .numberPad
        
//        cekTagihanButton.blueStyle()
    }

}
