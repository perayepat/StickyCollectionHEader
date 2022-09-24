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
        iv.contentMode = .scaleToFill
        return iv
    }()
    //animate blur view
    var animator: UIViewPropertyAnimator!
    
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout
        backgroundColor = .red
        addSubview(imageView)
        imageView.fillSuperview()
        //blur
        setupVisualEffectBlur()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Blur effect
    fileprivate func setupVisualEffectBlur() {
        addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        visualEffectView.contentMode = .scaleToFill
        
        // iOS 13 UPDATE: You now have to set .effect to nil, otherwise blur instantly begins at full intensity
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
            self.visualEffectView.effect = nil
        })
        // Reverse animator so that we can use fractionComplete of 0 as our "starting point". You don't have to do this, but it makes for easier calculations in your StretchyHeaderController.scrollViewDidScroll
        animator.isReversed = true
        animator.fractionComplete = 0
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
//
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
