//
//  CardsViewController.swift
//  Tinderly
//
//  Created by Joakim Jorde on 10/29/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var card: UIImageView!
    
    var cardCenter: CGPoint!
    var cardInitialCenter: CGPoint!
    var divisor: CGFloat!
    var touchLocation: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didMoveCard(_:)))
        card.addGestureRecognizer(panGestureRecognizer)
        cardInitialCenter = card.center
        
          divisor = (view.frame.width / 2)/0.5
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first!
        let location = touch.location(in: card)
        touchLocation = location
    }

    @IBAction func didMoveCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        if(touchLocation.y < cardInitialCenter.y)
        {
            card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
            print(xFromCenter)
        }
        else
        {
            card.transform = CGAffineTransform(rotationAngle: -xFromCenter/divisor)
            print(xFromCenter)
        }
      
        
        if sender.state == .began {
            cardCenter = cardInitialCenter
        } else if sender.state == .changed {
            card.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
        } else if sender.state == .ended {
            
            if (card.center.x < 50){
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x - 150, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
                
            }else if (card.center.x > (view.frame.width - 50)) {
                UIView.animate(withDuration: 0.5, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x + 150, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }
            resetCard()
        }
    }
    
    func resetCard() {
        self.card.transform = CGAffineTransform.identity
        self.card.center = cardInitialCenter
        self.card.alpha = 1
        
        
    }
    @IBAction func onTapCard(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tapCard", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let ProfileView = segue.destination as? ProfileViewController {
            ProfileView.image = card.image
        }

        // Pass the selected object to the new view controller.
    }

}
