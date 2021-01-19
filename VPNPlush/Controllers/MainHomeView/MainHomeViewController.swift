//
//  MainHomeViewController.swift
//  VPNPlush
//
//  Created by Robo Warrier on 24/11/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainHomeViewController: UIViewController
{
    @IBOutlet weak var iv_roket: UIImageView!
    @IBOutlet weak var lbl_letsGO: UILabel!
    
    @IBOutlet weak var lbl_status: UILabel!
     
    @IBOutlet weak var iv_Flag: UIImageView!
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_state: UILabel!
    
    var isConnect : Bool = false
    
    var rewardedAd: GADRewardedAd?
    
    var isRewarded = Bool()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //CreateReqardAds
        self.createAndLoadRewardedAd()
    }
    
    
    @IBAction func connect_Click(_ sender: Any) {
        if !self.isConnect {
            showWatchAdsPopup()
        } else {
            connectVPNServer()
        }
    }
    
    func connectVPNServer()
    {
        self.isConnect.toggle()
        if self.isConnect {
            self.lbl_letsGO.text = "STOP"
            self.lbl_status.text = "Connected"
            self.lbl_status.textColor = #colorLiteral(red: 0.08235294118, green: 0.8, blue: 0.5607843137, alpha: 1)
            self.iv_roket.image = #imageLiteral(resourceName: "rocket_connect")
        } else {
            self.lbl_letsGO.text = "LET'S GO"
            self.lbl_status.text = "Not Connected"
            self.lbl_status.textColor = #colorLiteral(red: 0.05490196078, green: 0.137254902, blue: 0.3176470588, alpha: 1)
            self.iv_roket.image = #imageLiteral(resourceName: "rocket")
        }
    }
    
    @IBAction func settings_Click(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "settingsViewController") as! settingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btn_purchaseClick(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "purchaseViewController") as! purchaseViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func setverListClick(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "serverListViewController") as! serverListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func setver_Select_Click(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "serverListViewController") as! serverListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showWatchAdsPopup()
    {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let objPopUpView : WatchAdPopupViewController = storyboard.instantiateViewController(withIdentifier: "WatchAdPopupViewController") as! WatchAdPopupViewController
        objPopUpView.delegate = self
        objPopUpView.modalPresentationStyle = .overCurrentContext
        objPopUpView.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(objPopUpView, animated: true, completion: nil)
    }


}

extension MainHomeViewController : WatchAdPopupVCDelegate
{
    func watchAndUnlock() {
        self.isRewarded = false
        if self.rewardedAd?.isReady == true {
            self.rewardedAd?.present(fromRootViewController: self, delegate:self)
        }
    }
}

extension MainHomeViewController : GADRewardedAdDelegate
{
    func createAndLoadRewardedAd()
    {
      rewardedAd = GADRewardedAd(adUnitID: AppConstants.ADMOB_REWARDED_ID)
      rewardedAd?.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
    }
    
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        self.createAndLoadRewardedAd()
        
        if self.isRewarded == true
        {
            connectVPNServer()
        }
    }
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        self.isRewarded = true
    }
}
