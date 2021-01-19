//
//  serverListViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 24/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit

class server_HeaderCell: UITableViewCell
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

class server_RowCell: UITableViewCell
{
    @IBOutlet weak var iv_flag: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var iv_signal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

class serverListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var freeS : [[String:String]] = [["Name":"USA Free","Signal":"s_weak","Flag":"united-states"]]
    
    var premiumS : [[String:String]] = [["Name":"Canada","Signal":"s_full","Flag":"canada"],
                                        ["Name":"Germany","Signal":"s_full","Flag":"germany"],
                                        ["Name":"India","Signal":"s_full","Flag":"india"],
                                        ["Name":"Netherlands","Signal":"s_full","Flag":"netherlands"],
                                        ["Name":"Singapore","Signal":"s_full","Flag":"singapore"],
                                        ["Name":"United Kingdom","Signal":"s_full","Flag":"united-kingdom"],
                                        ["Name":"United States Pro","Signal":"s_full","Flag":"united-states"]]
    
    var stremingS : [[String:String]] = [["Name":"Germany - Netfilx","Signal":"s_full","Flag":"germany"],
                                        ["Name":"Netherlands - Netfilx","Signal":"s_full","Flag":"netherlands"],
                                        ["Name":"United Kingdom - Netfilx","Signal":"s_full","Flag":"united-kingdom"],
                                        ["Name":"United States - Netfilx","Signal":"s_full","Flag":"united-states"]]
    var adblockS : [[String:String]] = [["Name":"United Kingdom - AdBlock","Signal":"s_full","Flag":"united-kingdom"],
                                        ["Name":"United States - AdBlock","Signal":"s_full","Flag":"united-states"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension serverListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableCell(withIdentifier: "server_HeaderCell") as? server_HeaderCell else {
            preconditionFailure("Unregistered table view header")
        }
        
        if section == 0 {
            header.lbl_title.text = "Free Servers"
        } else if section == 1 {
            header.lbl_title.text = "Premium Servers"
        } else if section == 2 {
            header.lbl_title.text = "Streaming Servers"
        } else if section == 3 {
            header.lbl_title.text = "AdBlock Servers"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return freeS.count
        }
        if section == 1 {
            return premiumS.count
        }
        if section == 2 {
            return stremingS.count
        }
        if section == 3 {
            return adblockS.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "server_RowCell", for: indexPath) as? server_RowCell else {
            preconditionFailure("Unregistered table view cell")
        }
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            let obj = self.freeS[indexPath.row]
            
            cell.iv_flag.image = UIImage.init(imageLiteralResourceName: obj["Flag"] ?? "")
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.iv_signal.image = UIImage.init(imageLiteralResourceName: obj["Signal"] ?? "")
        }
        
        if indexPath.section == 1 {
            let obj = self.premiumS[indexPath.row]
            
            cell.iv_flag.image = UIImage.init(imageLiteralResourceName: obj["Flag"] ?? "")
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.iv_signal.image = UIImage.init(imageLiteralResourceName: obj["Signal"] ?? "")
        }
        
        if indexPath.section == 2 {
            let obj = self.stremingS[indexPath.row]
            
            cell.iv_flag.image = UIImage.init(imageLiteralResourceName: obj["Flag"] ?? "")
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.iv_signal.image = UIImage.init(imageLiteralResourceName: obj["Signal"] ?? "")
        }
        
        if indexPath.section == 3 {
            let obj = self.adblockS[indexPath.row]
            
            cell.iv_flag.image = UIImage.init(imageLiteralResourceName: obj["Flag"] ?? "")
            cell.lbl_Title.text = obj["Name"] ?? ""
            cell.iv_signal.image = UIImage.init(imageLiteralResourceName: obj["Signal"] ?? "")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
}
