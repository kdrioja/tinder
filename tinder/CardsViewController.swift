//
//  CardsViewController.swift
//  tinder
//
//  Created by user145766 on 11/9/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var whereStarted: CGFloat!
    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImage.layer.cornerRadius = 50
        cardImage.clipsToBounds = true
        cardImage.isUserInteractionEnabled = true
        
    }
    
    @IBAction func onDidPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if sender.state == .began {
            whereStarted = sender.location(in: cardImage).y
        } else if sender.state == .changed {
            if whereStarted > 200 {
                if translation.x < 0 {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = min(45, -Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                } else {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = max(-45, -Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            } else {
                if translation.x < 0 {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = max(-45, Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                } else {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = min(45, Double(translation.x)/4) * Double.pi / 180
                    cardImage.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardImage.transform = cardImage.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
        } else if sender.state == .ended {
            pushOffScreen(translationCurrent: Int(translation.x))
        }
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
        
        // place ryan's image once again
    }
    
}
