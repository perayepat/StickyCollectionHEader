//
//  OverviewCell.swift
//  StickyCollectionHEader
//
//  Created by Pat on 2022/09/24.
//

import UIKit

class OverviewCell: UICollectionViewCell {
    
    
    //Overview Text
    private let overviewText: UITextView = {
       let textview = UITextView()
       let attributedText = NSMutableAttributedString(string: "Nutrition Overview",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedText
        textview.isEditable = false
        textview.isScrollEnabled = false
        textview.textAlignment = .left
        textview.backgroundColor = .gray.withAlphaComponent(0.2)
        textview.textContainerInset = UIEdgeInsets(top: 9, left: 10, bottom: 0, right: 0)
        textview.layer.cornerRadius = 20
        return textview
    }()
    
    private let calorieText: UITextView = {
       let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "100g",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)])
        attributedText.append(NSAttributedString(string: " \nCalories ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedText
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    private let fatText: UITextView = {
       let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "20g",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)])
        attributedText.append(NSAttributedString(string: " \nFats ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedText
        textview.isEditable = false
        textview.isScrollEnabled = false
        return textview
    }()
    private let proteinText: UITextView = {
       let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "200g",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)])
//        Protein :
        attributedText.append(NSAttributedString(string: " \nProtein ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedText
        textview.isEditable = false
        textview.isScrollEnabled = false
        
        return textview
    }()
    private let carbsText: UITextView = {
       let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "20g",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)])
        attributedText.append(NSAttributedString(string: " \nCarbs ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.attributedText = attributedText
        textview.isEditable = false
        textview.isScrollEnabled = false
//        textview.backgroundColor = .gray
//        textview.layer.cornerRadius = 15
        return textview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupStackViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
}


extension OverviewCell{
    
    func setupStackViews(){
        let cellImageContainer = UIView()
        cellImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [calorieText, fatText])
        let stackViewTwo = UIStackView(arrangedSubviews: [proteinText, carbsText])
        let VerticalStackView = UIStackView(arrangedSubviews: [stackView,stackViewTwo])
        
        stackView.distribution = .equalSpacing
        stackViewTwo.distribution = .equalSpacing
        
//        addSubview(VerticalStackView)
        addSubview(cellImageContainer)
        VerticalStackView.axis = .vertical
        VerticalStackView.distribution = .fillProportionally
        VerticalStackView.spacing = -35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        VerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        cellImageContainer.addSubview(VerticalStackView)
        cellImageContainer.backgroundColor = .white
   
        NSLayoutConstraint.activate([
            cellImageContainer.topAnchor.constraint(equalTo: overviewText.bottomAnchor),
            cellImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),

            
            VerticalStackView.topAnchor.constraint(equalTo: cellImageContainer.topAnchor),
            VerticalStackView.leadingAnchor.constraint(equalTo: cellImageContainer.leadingAnchor),
            VerticalStackView.trailingAnchor.constraint(equalTo: cellImageContainer.trailingAnchor),
            VerticalStackView.bottomAnchor.constraint(equalTo: cellImageContainer.bottomAnchor)
            
        ])
    }
    
    func setupLayout(){
        
        //subviews being addedd
        addSubview(overviewText)
        
        //constraints
        NSLayoutConstraint.activate([
            overviewText.leadingAnchor.constraint(equalTo: leadingAnchor),
            overviewText.centerYAnchor.constraint(equalTo: centerYAnchor),
            overviewText.widthAnchor.constraint(equalTo: widthAnchor),
            overviewText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            overviewText.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
        

    }
        
    
    //setup Layout
    
}
