//
//  ProfileViewController.swift
//  tinder
//
//  Created by user145766 on 11/9/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var passedImage: UIImage!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var navBarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarImageView.isUserInteractionEnabled = true
        profileImageView.image = passedImage
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        self.performSegue(withIdentifier: "mainSegue", sender: nil)
    }
    
}
