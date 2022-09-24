//
//  HeaderView.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/24.
//

import SwiftUI

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image:UIImage(named: "pizza"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout
        backgroundColor = .red
        addSubview(imageView)
        
        imageView.fillSuperview()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        Container().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct Container: UIViewControllerRepresentable {
//        
//        func makeUIViewController(context: Context) -> UIViewController {
//            UIViewController(nibName: "\(HeaderView.self)", bundle: Bundle.main)
//        }
//        
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//        
//        typealias UIViewControllerType = UIViewController
//        
//        
//    }
//}
