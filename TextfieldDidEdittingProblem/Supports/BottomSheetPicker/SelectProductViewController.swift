//
//  SelectProductViewController.swift
//
//  Created by Bobby Pehtrus on 22/09/19.
//  Copyright © 2019 Rupi. All rights reserved.
//

import UIKit

struct SelectionObject {
    /// Can be an index or id number
    let key : Int?
    /// Value of the selection object, NOT DISPLAYED
    let value : Any?
    /// String value of the selection object to be displayed
    let displayString : String
}

class SelectProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    typealias onSelectProduct = (_ result : SelectionObject)->Void

    @IBOutlet var cell: UITableViewCell!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet var mCellView: UITableViewCell!
    
    var mProductList : [SelectionObject] = []
    var mCallback : onSelectProduct? = nil
    
    convenience init(selectionList : [SelectionObject], onSelectProduct : onSelectProduct?) {
        self.init()
        self.mProductList = selectionList
        self.mCallback = onSelectProduct
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTableView.dataSource = self
        mTableView.delegate = self
        
        mTableView.tableFooterView = UIView()

    }
   
    func setCallback(callback : @escaping onSelectProduct){
        mCallback = callback
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "myIdentifier"
        var  cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if (cell == nil){
            let nib:Array = Bundle.main.loadNibNamed("product_cellview", owner: self, options: nil)!
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
        mCallback!(data)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.dismiss(animated: true, completion: nil)
    }
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

}
