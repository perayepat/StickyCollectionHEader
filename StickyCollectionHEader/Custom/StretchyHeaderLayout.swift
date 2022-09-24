//
//  StretchyHeaderLayout.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/24.
//
//MARK: - Notes
/// this only works for one header view

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
// modify the attributes of our header componenet somehow
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            //targets the first header and the rest is 
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                
                guard let collectionView = collectionView else {return}
                let contentOffestY = collectionView.contentOffset.y
                
                ///allows us to scroll up with no added effect
                if contentOffestY > 0{
                    return
                }
                //header
                //grabbed from the collection view
                let width = collectionView.frame.width - contentOffestY
                let height =  attributes.frame.height - contentOffestY
                attributes.frame = CGRect(x: 0, y: contentOffestY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    //this will recalculate the layout method
    //and will be called every frame
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
