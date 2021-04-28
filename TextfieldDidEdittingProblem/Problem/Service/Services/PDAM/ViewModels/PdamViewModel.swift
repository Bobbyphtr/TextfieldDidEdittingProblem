//
//  PdamViewModel.swift
//  
//
//  Created by BobbyPhtr on 26/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PdamViewModelDelegate : AnyObject {
    func onPickWilayah(_ wilayah : String)
}

class PdamViewModel {
    
    weak var coordinator : PPOBFlow!
    
    private let disposeBag = DisposeBag()
//    private weak var locationService : LocationService!
    
    weak var delegate : PdamViewModelDelegate?
    
    let currentWilayahObservable = BehaviorRelay<String?>.init(value: nil)
    let currentIdPelangganObservable = BehaviorSubject<String?>.init(value: nil)
    
//    init(coordinator : PPOBFlow, locationService : LocationService) {
//        self.coordinator = coordinator
//        self.locationService = locationService
//    }
    
    init(coordinator : PPOBFlow) {
        self.coordinator = coordinator
    }
    
    func pickWilayah(){
        coordinator.goToFullScreenPicker(selectionList: [SelectionObject.init(key: 0, value: nil, displayString: "Hellow")], pickerTitle: "Wilayah PDAM", searchPlaceholder: "Cari Wilayah", pickerListTitle: "Pilih Wilayah PDAM")
            .subscribe(onNext: { [unowned self] in
                delegate?.onPickWilayah($0.displayString)
            })
            .disposed(by: disposeBag)
    }
    
}
