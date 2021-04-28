//
//  TransactionContainerViewController.swift
//
//
//  Created by BobbyPhtr on 29/03/21.
//

import UIKit
import RxCocoa
import RxSwift

class TransactionContainerViewController: UIViewController, Storyboarded {
    
    var viewModel : TransactionContainerViewModel!
    @IBOutlet weak var headerBgView: UIView!
    @IBOutlet weak var cashTitle: UILabel!
    @IBOutlet weak var cashSaldo: UILabel!
    
    @IBOutlet weak var headerSpacer: UIView!
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    // property
    var childViewController : UIViewController!
    private let disposeBag = DisposeBag()
    
    convenience init(childVC : UIViewController) {
        self.init()
        self.childViewController = childVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
        addChildViewController()
        
//        viewModel.getSaldo()
    }
    
    private func configureView(){
        
//        headerSpacer.backgroundColor = UIColor.primaryColor
//        headerBgView.addSoftDropShadow()
        headerBgView.backgroundColor = .white
        
        containerView.backgroundColor = .clear
        
//        cashTitle.font = FontManager.getBody2(fontAttribute: .bold)
//        cashTitle.textColor = .primaryColor
//
//        cashSaldo.font = FontManager.getBody2(fontAttribute: .bold)
//        cashSaldo.textColor = .secondaryColor
        
        centerYConstraint.constant = headerSpacer.bounds.maxY / 2
        
//        viewModel.saldoRupiCasObservable
//            .map { $0?.toCurrencyFormat() }
//            .bind(to: cashSaldo.rx.text)
//            .disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if let navCon = childViewController as? UINavigationController {
//            if navCon.viewControllers[0] is LoadingViewController {
//                viewModel.featureIsNotAvailable()
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        showNavigationController(navStyle: .blue)
    }
    
    func addChildViewController(){
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])
        
        childViewController.didMove(toParent: self)
    }

}
