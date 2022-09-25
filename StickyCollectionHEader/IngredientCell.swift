//
//  IngedientCell.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/25.
//

import UIKit

class IngredientCell: UICollectionViewCell {
    private let ingredientImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "xmark.circle.fill"))
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Cheese",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: " \nCheeder Cheese", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
//        textView.text = "Count your calories"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
}


//Setup
extension IngredientCell{
    func setupLayout(){
        addSubview(ingredientImage)
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            ingredientImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            ingredientImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            ingredientImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            ingredientImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -150),
            
            descriptionTextView.leadingAnchor.constraint(equalTo: ingredientImage.trailingAnchor, constant: 20),
//            descriptionTextView.centerXAnchor.constraint(equalTo: ingredientImage.centerXAnchor),
//            descriptionTextView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        ])
    }
}
