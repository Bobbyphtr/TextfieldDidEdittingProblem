//
//  PdamViewController.swift
//  
//
//  Created by BobbyPhtr on 26/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialComponents

class PdamViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel : PdamViewModel!
    
    private let disposeBag = DisposeBag()

    @IBOutlet weak var nomorPelangganField: MDCFilledTextField!
    @IBOutlet weak var pilihWilayahPdamField: MDCFilledTextField!
    
    @IBOutlet weak var cekTagihanButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureViews()
        configureBindings()
        
        pilihWilayahPdamField.delegate = self
        viewModel.delegate = self
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == pilihWilayahPdamField {
            print("Pilih Wilayah Field")
            self.viewModel.pickWilayah()
            return false
        }
        return true
    }
    
    private func configureBindings() {
//        pilihWilayahPdamField.rx.controlEvent(.editingDidBegin)
////            .debounce(.milliseconds(250), scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] in
//
//            })
//            .disposed(by: disposeBag)
        
        viewModel.currentIdPelangganObservable
            .bind(to: nomorPelangganField.rx.text)
            .disposed(by: disposeBag)
        
//        viewModel.currentWilayahObservable.bind(to: pilihWilayahPdamField.rx.text)
//            .disposed(by: disposeBag)
    }


    private func configureViews(){
//        cekTagihanButton.blueStyle()
        
//        nomorPelangganField.outlineStyle()
        nomorPelangganField.label.text = "Nomor ID Pelanggan"
        
//        pilihWilayahPdamField.dropdownStyle()
        pilihWilayahPdamField.label.text = "Pilih Wilayah"
        
    }

}

extension PdamViewController : PdamViewModelDelegate {
    
    func onPickWilayah(_ wilayah: String) {
        pilihWilayahPdamField.text = wilayah
    }
    
    
}
