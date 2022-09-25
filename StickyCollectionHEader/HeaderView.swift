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
        //gradient
        setupGradientLayer()
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
    
    //gradient layer
    fileprivate func setupGradientLayer(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
//        layer.addSublayer(gradientLayer)
        
        //using a subview to make it more dynamic
        let gradientcontainerView = UIView()
        addSubview(gradientcontainerView)
        gradientcontainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientcontainerView.layer.addSublayer(gradientLayer)
        //needs a frame, static frame
        gradientLayer.frame = self.bounds
        
        //trick to move the black gradient layer
        gradientLayer.frame.origin.y -= bounds.height
        
        //adding the label
        let heavyLabel = UILabel()
        heavyLabel.text = "Pizza"
        heavyLabel.font = .systemFont(ofSize: 44, weight: .heavy)
        heavyLabel.textColor = .white
        
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "These are the ingredients inside the pizza and the nuttrients are below"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        
        //adding them using a stackview
        let stackView  = UIStackView(arrangedSubviews: [
            heavyLabel,descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 15
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    
}

