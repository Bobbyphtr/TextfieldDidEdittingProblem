//
//  FullScreenDataPickerController.swift
//
//  Created by BobbyPhtr on 01/04/21.
//  Copyright © 2021 Rupi. All rights reserved.
//

import UIKit
import MaterialComponents.MDCButton
import RxSwift
import RxCocoa
import RxDataSources

class FullScreenDataPickerController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: MDCButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet var cell: UITableViewCell!
    
    var mProductList : [SelectionObject] = []
    
    let productChoosenObservable = PublishSubject<SelectionObject>()
    
    private let disposeBag = DisposeBag()
    
    var pickerTitle : String?
    var searchPlaceholder : String?
    var listTitle : String?
    
    convenience init(selectionList : [SelectionObject]) {
        self.init()
        self.mProductList = selectionList
    }
    
    convenience init(selectionList : [SelectionObject], pickerTitle : String?, searchPlaceholder : String?, listTitle : String?) {
        self.init(selectionList : selectionList)
        self.pickerTitle = pickerTitle
        self.searchPlaceholder = searchPlaceholder
        self.listTitle = listTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureBindings()
    }
    
    private func configureView(){
        titleLabel.text = pickerTitle?.uppercased() ?? "PICKER"
//        titleLabel.font = FontManager.getBody1(fontAttribute: .bold)
        closeButton.setBackgroundColor(.clear)
        closeButton.setImage(nil, for: .normal)
        closeButton.setBackgroundImage(UIImage.init(named: "ic_xmark_black"), for: .normal)
        closeButton.imageView?.contentMode = .scaleAspectFill
        
        listTableView.tableFooterView = UIView()
        listTableView.dataSource = self
        listTableView.delegate = self
        
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = searchPlaceholder
        
    }
    
    private func configureBindings(){
        closeButton.rx.tap
            .bind {
                self.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        
    }

}

extension FullScreenDataPickerController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.listTitle
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
//        headerView.textLabel?.font = FontManager.getBody3(fontAttribute: .bold)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "myIdentifier"
        var  cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if (cell == nil){
            let nib:Array = Bundle.main.loadNibNamed("selection_cellview", owner: self, options: nil)!
            cell = nib[0] as? UITableViewCell
        }
        
        let data = mProductList[indexPath.row]
        cell.selectionStyle = .none
        let lblName : UILabel = cell.viewWithTag(100) as! UILabel
        lblName.text = "\(data.displayString)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let data = mProductList[indexPath.row]
        productChoosenObservable.onNext(data)
        self.dismiss(animated: true, completion: nil)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
