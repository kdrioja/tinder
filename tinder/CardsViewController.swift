//
//  CardsViewController.swift
//  tinder
//
//  Created by user145766 on 11/9/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pushOffScreen(translationCurrent: Int!) {
        if translationCurrent > 0 {
            if translationCurrent > 50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardImage.center.x += 100
                }) { (success) in
                    if success {
                        self.cardImage.isHidden = true
                    }
                }
            } else {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardImage.transform = CGAffineTransform.identity
                }) { (success) in
                    if success {
                        self.cardImage.isHidden = false
                    }
                }
            }
        } else {
            if translationCurrent < -50 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardImage.center.x -= 100
                }) { (success) in
                    if success {
                        self.cardImage.isHidden = true
                    }
                }
            } else {
                UIView.animate(withDuration: 0.1, animations: {
                    self.cardImage.transform = CGAffineTransform.identity
                }) { (success) in
                    if success {
                        self.cardImage.isHidden = false
                    }
                }
            }
        }
    }
    
}
