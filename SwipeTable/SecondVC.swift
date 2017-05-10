//
//  SecondVC.swift
//  SwipeTable
//
//  Created by Cemal Bayrı on 09/05/2017.
//  Copyright © 2017 Cemal Bayrı. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var closeMainCells = true

    @IBOutlet weak var colView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colView.delegate = self
        colView.dataSource = self
        
       

        let nib = UINib(nibName: "CustomCell", bundle: nil)
        colView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    func tappedEmpty(){
        closeMainCells = false
        colView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.customMainView.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 300)
    }


}
