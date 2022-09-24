//
//  StretchyHeaderCollectionViewController.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class StretchyHeaderCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }

}
