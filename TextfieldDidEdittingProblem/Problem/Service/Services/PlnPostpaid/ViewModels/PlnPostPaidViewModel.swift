//
//  PlnPostPaidViewModel.swift
//  
//
//  Created by BobbyPhtr on 26/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PlnPostPaidViewModel {
    
    enum TipePembayaranPln : String, CaseIterable {
        case tagihanListrik = "Tagihan Listrik"
        case nonTagihanListrik = "Non Tagihan Listrik"
    }
    
    weak var coordinator : PPOBFlow!
    
    private let disposeBag = DisposeBag()
//    private weak var locationService : LocationService!
    
    
    let currentProdukListBehaviorSubject = BehaviorSubject<TipePembayaranPln?>.init(value: nil)
    let currentIdPelangganBehaviorSubject = BehaviorSubject<String?>.init(value: nil)
    
    init(coordinator : PPOBFlow) {
        self.coordinator = coordinator
//        self.locationService = locationService
    }
    
    func showProdukListrik(){
        coordinator.showBottomSheetPicker(selectionList: TipePembayaranPln.allCases.map { SelectionObject.init(key: 0, value: $0, displayString: $0.rawValue) })
            .subscribe(onNext: { [unowned self] in
                self.currentProdukListBehaviorSubject.onNext($0.value as? TipePembayaranPln)
            })
            .disposed(by: disposeBag)
            
    }
    
}
