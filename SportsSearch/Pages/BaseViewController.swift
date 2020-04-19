//
//  BaseViewController.swift
//  WhoTapFast
//
//  Created by JackSen on 2020/3/19.
//  Copyright © 2020 JackSen. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    deinit {
        print("[DEBUG]: \(String(describing: self.classForCoder)) deinit")
    }

}
