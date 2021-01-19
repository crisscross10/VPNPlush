//
//  WatchAdPopupViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 26/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit

class WatchAdPopupViewController: UIViewController {

    weak var delegate: WatchAdPopupVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func watchAndUnlock(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegate?.watchAndUnlock()
        })

    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

protocol WatchAdPopupVCDelegate: class {
    func watchAndUnlock()
}
