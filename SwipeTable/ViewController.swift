//
//  ViewController.swift
//  SwipeTable
//
//  Created by Cemal Bayrı on 09/05/2017.
//  Copyright © 2017 Cemal Bayrı. All rights reserved.
//

import UIKit

class CellTag {

    var tag = -1
    
    static let shared: CellTag = CellTag()

}

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var tbView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbView.delegate = self
        tbView.dataSource = self
        
        let nib = UINib(nibName: "CustomTbCell", bundle: nil)
        tbView.register(nib, forCellReuseIdentifier: "cell")
        
        
        tbView.separatorColor = UIColor.clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.dismissAnimatedCell), name: notiDismissCell, object: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dismissAnimatedCell()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTbCell
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func dismissAnimatedCell() {
        if CellTag.shared.tag != -1 {
            if let cll = self.view.viewWithTag(CellTag.shared.tag) {
                let cell = cll as! CustomTbCell
                cell.dismiss()
            }
        }
    }
    
    
}

