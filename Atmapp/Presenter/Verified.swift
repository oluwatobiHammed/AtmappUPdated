//
//  Verified.swift
//  Atmapp
//
//  Created by user on 02/10/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
class Verified: UIViewController {

    
    @IBOutlet weak var verfiedImages: UIImageView!
    
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var successMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        verfiedImages.image = #imageLiteral(resourceName: "icons8-checkmark-64")
        successLabel.textColor = UIColor.black
        successLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
         successMessageLabel.textColor = UIColor.lightGray
         successMessageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 10)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: animated)
         self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
         self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func okButton(_ sender: Any) {
        //performSegue(withIdentifier: "Home", sender: self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "card") as! CardView
                        self.show(nextViewController, sender: self)
    }
}
