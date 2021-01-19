//
//  settingsViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 25/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit

class settings_HeaderCell: UITableViewCell
{
    @IBOutlet weak var lbl_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class settings_RowCell: UITableViewCell
{
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var lbl_SubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


class settingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var accDetail : [[String:String]] = [["Name":"Package","subTitle":"Premium"],["Name":"Subscripation","subTitle":"30 days"]]
    
    var otherDetail : [[String:String]] = [["Name":"Restore Purchase","subTitle":"▷"],["Name":"Feedback","subTitle":"▷"],["Name":"Rate","subTitle":"▷"],["Name":"Privacy Policy","subTitle":"▷"],["Name":"Terms of Use","subTitle":"▷"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_purchaseClick(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "purchaseViewController") as! purchaseViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension settingsViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableCell(withIdentifier: "settings_HeaderCell") as? settings_HeaderCell else {
            preconditionFailure("Unregistered table view header")
        }
        
        if section == 0 {
            header.lbl_title.text = "Account detail"
        } else if section == 1 {
            header.lbl_title.text = "Other settings"
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return accDetail.count
        }
        if section == 1 {
            return otherDetail.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settings_RowCell", for: indexPath) as? settings_RowCell else {
            preconditionFailure("Unregistered table view cell")
        }
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            let obj = self.accDetail[indexPath.row]
            
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.lbl_SubTitle.text = obj["subTitle"] ?? ""
        }
        
        if indexPath.section == 1 {
            let obj = self.otherDetail[indexPath.row]
            
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.lbl_SubTitle.text = obj["subTitle"] ?? ""
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let obj = self.otherDetail[indexPath.row]
            if let name = obj["Name"], name == "Privacy Policy" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "privacyViewController") as! privacyViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if let name = obj["Name"], name == "Terms of Use" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "termsViewController") as! termsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if let name = obj["Name"], name == "Feedback" {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }

        }
    }
}
