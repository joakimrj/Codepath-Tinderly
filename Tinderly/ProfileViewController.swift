//
//  ProfileViewController.swift
//  Tinderly
//
//  Created by Joakim Jorde on 10/29/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picture.image = image!
    }
    
    @IBAction func onTapDone(_ sender: UITapGestureRecognizer) {
        print("Fuu")
        self.dismiss(animated: true) {}
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
