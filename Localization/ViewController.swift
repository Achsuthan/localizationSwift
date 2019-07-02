//
//  ViewController.swift
//  Localization
//
//  Created by Achsuthan Mahendran on 2/7/19.
//  Copyright © 2019 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblLable: UILabel!
    @IBOutlet weak var btTamil: UIButton!
    @IBOutlet weak var btEnglish: UIButton!
    @IBOutlet weak var btDutch: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set("en", forKey: "i18n_language")
        self.setUpLabel()
        
        self.btEnglish.addTarget(self, action: #selector(self.btEnglish(_:)), for: .touchUpInside)
        
        self.btTamil.addTarget(self, action: #selector(self.btTamil(_:)), for: .touchUpInside)
        
        self.btDutch.addTarget(self, action: #selector(self.btDutch(_:)), for: .touchUpInside)
    }
    
    func setUpLabel(){
        self.lblLable.text = "head_language".localized
    }
    
    @IBAction func btTamil(_: Any){
        UserDefaults.standard.set("ta", forKey: "i18n_language")
        self.setUpLabel()
    }
    
    @IBAction func btEnglish(_: Any){
        UserDefaults.standard.set("en", forKey: "i18n_language")
        self.setUpLabel()
    }
    
    @IBAction func btDutch(_: Any){
        UserDefaults.standard.set("nl", forKey: "i18n_language")
        self.setUpLabel()
    }


}

extension String {
    var localized: String {
        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
            // we set a default, just in case
            UserDefaults.standard.set("ta", forKey: "i18n_language")
            UserDefaults.standard.synchronize()
        }
        
        let lang = UserDefaults.standard.string(forKey: "i18n_language")
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

