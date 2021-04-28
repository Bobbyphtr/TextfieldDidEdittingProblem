//
//  Constant.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import Foundation
import UIKit

enum Service : String {
    case pulsaData = "Pulsa & Data"
    case tokenPln = "Token PLN"
    case eMoney = "E-Money"
    case pln = "PLN"
    case bpjsKesehatan = "BPJS Kesehatan"
    case telkom = "Telkom"
    case tvkabel = "TV Kabel"
    case pdam = "PDAM"
    case pascabayar = "Pulsa Pascabayar"
    case finance = "Finance"
    
    var serviceIcon : UIImage? {
        get {
            switch self {
            case .pulsaData:
                return UIImage.init(named: "ic_pulsa")
            case .tokenPln:
                return UIImage.init(named: "ic_token")
            case .eMoney:
                return UIImage.init(named: "ic_emoney")
            case .pln:
                return UIImage.init(named: "ic_pln")
            case .bpjsKesehatan:
                return UIImage.init(named: "ic_bpjs")
            case .telkom:
                return UIImage.init(named: "ic_telkom")
            case .tvkabel:
                return UIImage.init(named: "ic_tvkabel")
            case .pdam:
                return UIImage.init(named: "ic_pdam")
            case .pascabayar:
                return UIImage.init(named: "ic_pascabayar")
            case .finance:
                return UIImage.init(named: "ic_finance")
            }
        }
    }
    
    static func getProductIcon(by code : String, produk : String)->UIImage? {
        
        switch code.lowercased() {
        case "tvkabel":
            if produk.lowercased() == "7001" {  // Indovision
                return UIImage.init(named: "ic_tvkabel")
            } else if produk.lowercased() == "7012" {  // First Media
                return UIImage.init(named: "ic_tvkabel")
            } else {
                return UIImage.init(named: "ic_tvkabel")
            }
        case "2008":
            return UIImage.init(named: "ic_wom")
        case "listrik", "pln", "pln_postpaid":
            return UIImage.init(named: "ic_pln")
        case "kartu_kredit":
            return UIImage.init(named: "ic_bni")
        case "three": // tri
            return UIImage.init(named: "ic_pulsa")
        case "xl", "5002": // xl
            return UIImage.init(named: "ic_pulsa")
        case "tsel", "tsell", "5001", "mbulk": // telkomsel
            return UIImage.init(named: "ic_pulsa")
        case "isat", "5003": // Indosat
            return UIImage.init(named: "ic_pulsa")
        case "axis": // Axis
            return UIImage.init(named: "ic_pulsa")
        case "smartfren": // Smartframe
            return UIImage.init(named: "ic_pulsa")
        case "bolt":
            return UIImage.init(named: "ic_bolt")
        case "multifinance": // wom
            return UIImage.init(named: "ic_finance")
        case "emoney":
            if produk.lowercased() == "2121" || produk.lowercased() == "2101"{ // gojek
                return UIImage.init(named: "ic_emoney")
            }
            return UIImage.init(named: "ic_emoney")
        case "gopay-customer", "gopay-merchant", "gopay-driver": // gojek
            return UIImage.init(named: "ic_emoney")
        case "bpjs_ketenagakerjaan":
            return UIImage.init(named: "ic_bpjs")
        case "bpjs_kesehatan":
            return UIImage.init(named: "ic_bpjs")
        case "pasca":
            if produk.lowercased() == "5002" { // xl
                return UIImage.init(named: "ic_pascabayar")
            }
            return UIImage.init(named: "ic_pascabayar")
        case "telkom":
            return UIImage.init(named: "ic_telkom")
        case "pdam":
            if produk.lowercased() == "4011" { // aetra
                return UIImage.init(named: "ic_pdam")
            }
            return UIImage.init(named: "ic_pdam")
        case "ic_bca", "ic_bca_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_mandiri_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_maybank_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_bri_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_bni_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_alfa":
            return UIImage.init(named: "ic_saldo")
        case "ic_permata_va":
            return UIImage.init(named: "ic_saldo")
        case "ic_danamon_va":
            return UIImage.init(named: "ic_saldo")
        case "trans": // ???
            return UIImage.init(named: "ic_rupi_blue") // ??? ic_topup
//        case "cashback":
//            return UIImage.init(named: "ic_cashback") // sudah tidak ada
        case "ic_indomaret":
            return UIImage.init(named: "ic_saldo")
        case "ic_rupi_kios":
            return UIImage.init(named: "ic_saldo") // ???
        case "ovo":
            return UIImage.init(named: "ic_emoney")
        case "dana" :
            return UIImage.init(named: "ic_emoney")
        default:
            return UIImage.init(named: "ic_rupi_blue") // ???
        }
        
    }
    
    init?(fromCode: String) {
        switch fromCode.lowercased() {
        case "tvkabel" :
            self = .tvkabel
        case "2008":
            self = .finance
        case "listrik", "pln", "pln_postpaid":
            self = .pln
        case "kartu_kredit", "emoney", "gopay-customer", "gopay-merchant", "gopay-driver", "ovo", "dana":
            self = .eMoney
        case "three", "xl", "5002", "tsel", "tsell", "5001", "mbulk", "isat", "5003", "axis", "smartfren", "bolt":
            self = .pulsaData
        case "multifinance":
            self = .finance
        case "bpjs_ketenagakerjaan", "bpjs_kesehatan":
            self = .bpjsKesehatan
        case "pasca":
            self = .pascabayar
        case "telkom":
            self = .telkom
        case "pdam":
            self = .pdam
        default:
            return nil
        }
    }
}
