//
//  purchaseViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 24/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit
class purchase_FooterCell: UITableViewCell
{
    @IBOutlet weak var btn_NoThanks: UIButton!
    @IBOutlet weak var btn_Restore: UIButton!
    
    @IBOutlet weak var lbl_SelectedPlan: UILabel!
    
    @IBOutlet weak var btn_Subscribe: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btn_Subscribe.layer.cornerRadius = 25.0
        self.btn_Subscribe.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

class purchase_RowCell: UITableViewCell
{
    @IBOutlet weak var iv_back: UIImageView!
    @IBOutlet weak var view_Back: borderedShadowCardView!
    
    @IBOutlet weak var lbl_Period: UILabel!
    @IBOutlet weak var lbl_Price: UILabel!
    @IBOutlet weak var lbl_trial: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.iv_back.layer.cornerRadius = 20.0
        self.iv_back.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class purchaseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension purchaseViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableCell(withIdentifier: "purchase_FooterCell") as? purchase_FooterCell else {
            preconditionFailure("Unregistered table view header")
        }
        
        footer.btn_NoThanks.addTarget(self, action: #selector(self.btn_backClick(_:)), for: .touchUpInside)
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "purchase_RowCell", for: indexPath) as? purchase_RowCell else {
            preconditionFailure("Unregistered table view cell")
        }
        cell.selectionStyle = .none
        
        if self.selectedIndex == indexPath.row {
            cell.lbl_Period.textColor = .white
            cell.lbl_Price.textColor = .white
            cell.lbl_trial.textColor = .white
            
            cell.view_Back.isHidden = true
            cell.iv_back.isHidden = false
        } else {
            cell.lbl_Period.textColor = .darkGray
            cell.lbl_Price.textColor = .darkGray
            cell.lbl_trial.textColor = .darkGray
            
            cell.view_Back.isHidden = false
            cell.iv_back.isHidden = true
        }
        
        if indexPath.row == 0 {
            cell.lbl_Period.text = "1 Week"
            cell.lbl_Price.text = "$5.99"
        } else if indexPath.row == 1 {
            cell.lbl_Period.text = "1 Month"
            cell.lbl_Price.text = "$14.99"
        } else if indexPath.row == 2 {
            cell.lbl_Period.text = "1 Year"
            cell.lbl_Price.text = "$59.99"
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.tableView.reloadData()
    }
    
    @objc func btn_backClick(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
