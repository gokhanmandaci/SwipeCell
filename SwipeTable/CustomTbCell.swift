//
//  CustomTbCell.swift
//  SwipeTable
//
//  Created by Cemal Bayrı on 09/05/2017.
//  Copyright © 2017 Cemal Bayrı. All rights reserved.
//

import UIKit

let notiDismissCell = Notification.Name(rawValue:"notiDismissCell")

class CustomTbCell: UITableViewCell {
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var customMainView: UIView!
    
    private var swipedIndex = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(CustomTbCell.swipeAction(_:)))
        gesture.direction = .left
        customMainView.addGestureRecognizer(gesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomTbCell.dismiss))
        customMainView.addGestureRecognizer(tapGesture)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func swipeAction(_ sender: UITapGestureRecognizer) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        if leading.constant != 0 {
            CellTag.shared.tag = -1
            self.setConstraints(duration: 0.3, constant: 0)
        } else {
            NotificationCenter.default.post(name: notiDismissCell, object: nil)
            if self.tag == 0 {
                self.tag = 10000
            }
            CellTag.shared.tag = self.tag
            self.setConstraints(duration: 0.3, constant: -40)
        }
    }
    
    func dismiss() {
        self.setConstraints(duration: 0.3, constant: 0)
    }
    
    func setConstraints(duration: TimeInterval, constant: CGFloat) {
        UIView.animate(withDuration: duration, animations: {
            self.leading.constant = constant
            self.layoutIfNeeded()
        }) { (fin) in
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    
}
