//
//  CalendarButton.swift
//  CustomControlTask
//
//  Created by Patrick Roskam on 4/26/18.
//  Copyright © 2018 PatrickMRoskam. All rights reserved.
//

import UIKit

@IBDesignable
class CalendarButton: UIControl {

    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15.0, weight: UIFont.Weight.regular)
        return label
    }()

    private var spaceConstraint : NSLayoutConstraint!
    
    @IBInspectable
    var spacing: CGFloat = 0.0 {
        didSet {
            spaceConstraint?.constant = spacing
        }
    }
    
    @IBInspectable
    var image: UIImage? {
        get {
            return imageView.image
        }
        set(newImage) {
            imageView.image = newImage?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    @IBInspectable
    var text: String? {
        get {
            return label.text
        }
        set(newText) {
            label.text = newText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
    
    private func initialization() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(imageView)
        
        spaceConstraint = label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing)
        
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                spaceConstraint,
                label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
                imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor)
            ]
        )
        
        layer.cornerRadius = 10
        
        addTapGestureRecognizer()
    }
}

extension CalendarButton {
    fileprivate func addTapGestureRecognizer() {
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleCalendarButtonTapped(sender:)))
        addGestureRecognizer(tapGestureRecogniser)
    }
    
    @objc func handleCalendarButtonTapped(sender: UITapGestureRecognizer) {
        sendActions(for: .touchUpInside)
    }
}
