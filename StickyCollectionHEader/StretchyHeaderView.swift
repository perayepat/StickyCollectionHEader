//
//  StretchyHeaderView.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/24.
//

import SwiftUI

class StretchyHeaderViewControl: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    fileprivate let padding: CGFloat = 16
    //refrence to our header
    var headerView: HeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        //layout customization
        setupCollectionViewLayout()
        collectionView?.register(OverviewCell.self, forCellWithReuseIdentifier: "overviewID")
        collectionView?.register(IngredientCell.self, forCellWithReuseIdentifier: "ingredientID")
    }
    
    init() {
        
        super.init(collectionViewLayout: StretchyHeaderLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupCollectionViewLayout(){
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionInset = .init(top: padding , left: padding, bottom: padding, right: padding)
        }
    }
    func setupCollectionView(){
        collectionView?.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        //collectionView header
        collectionView.register(HeaderView.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader ,withReuseIdentifier: headerId)
        
    }
    
}

//layout setup
extension StretchyHeaderViewControl{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "overviewID", for: indexPath) as! OverviewCell
            return cell
        }else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            
            let title = UITextView(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.height))
            title.text = "Ingredients"
            title.font = UIFont.boldSystemFont(ofSize: 18)
            title.textAlignment = .left
            title.textContainerInset = UIEdgeInsets(top: 9, left: 10, bottom: 0, right: 0)
            cell.layer.cornerRadius = 20
            cell.layer.backgroundColor = CGColor.init(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            cell.contentView.addSubview(title)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientID", for: indexPath) as! IngredientCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: view.frame.width  - 2 * padding, height: 200)
        }else if indexPath.item == 1{
            return .init(width: view.frame.width  - 2 * padding, height: 40)
        }else{
            return .init(width: view.frame.width  - 2 * padding, height: 60)
        }
        
    }
    //header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
        return headerView!
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffestY = scrollView.contentOffset.y
        //dont blur on scroll down
        if contentOffestY > 0 {
            headerView?.animator.fractionComplete  = 0
            return
        }
        headerView?.animator.fractionComplete = abs(contentOffestY) / 150
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 440)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> UIViewController {
            StretchyHeaderViewControl()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
        
        typealias UIViewControllerType = UIViewController
        
    }
}

