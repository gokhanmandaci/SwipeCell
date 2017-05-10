//
//  CustomCell.swift
//  SwipeTable
//
//  Created by Cemal Bayrı on 09/05/2017.
//  Copyright © 2017 Cemal Bayrı. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var customMainView: UIView!
    @IBOutlet weak var nearViewLeading: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        print(nearViewLeading.constant)
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(CustomCell.swipeAction))
        gesture.direction = .left
        
        customMainView.addGestureRecognizer(gesture)
    }

    
    func swipeAction(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            self.setConstraints(duration: 0.4, constant: -100)
        }
    
    }
    
   
    
    func setConstraints(duration: TimeInterval, constant: CGFloat) {
        UIView.animate(withDuration: duration) {
            self.nearViewLeading.constant = constant
            self.layoutIfNeeded()
            print(self.nearViewLeading.constant)
        }
    }
    
    
}
