//
//  ViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 11/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MainHomeViewController") as! MainHomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}





