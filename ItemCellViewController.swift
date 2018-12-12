//
//  ItemCellViewController.swift
//  OrganIzit
//
//  Created by Nathalie Hilbert on 2018-12-11.
//  Copyright © 2018 Cole Campbell. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func increaseNumber(cell: ItemLayoutCell,number : Int)
    func decreaseNumber(cell: ItemLayoutCell,number : Int)
}

class ItemLayoutCell : UITableViewCell {
    var delegate: ItemCellDelegate?
    let minValue = 0
    
    
    var item : Item? {
        didSet {
            itemNameLabel.text = item?.name
            itemTypeLabel.text = "\(item!.type)"
        }
    }
    
    
    private let itemNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    
    private let itemTypeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let decreaseButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "List_Icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let increaseButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "List_Icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    var itemQuant : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = ""
        label.textColor = .black
        return label
    }()
    
    @objc func decreaseFunc() {
        changeQuantity(by: -1)
        
    }
    
    @objc func increaseFunc() {
        changeQuantity(by: 1)
    }
    
    
    func changeQuantity(by amount: Int) {
        var quant: Int
        if itemQuant.text == ""{
            quant = 0
        }
        else{
            quant = Int(itemQuant.text!)!
        }
        quant += amount
        if quant <= minValue {
            quant = 0
            itemQuant.text = ""
        } else {
            itemQuant.text = "\(quant)"
        }
        delegate?.decreaseNumber(cell: self, number: quant)
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemNameLabel)
        addSubview(itemTypeLabel)
        addSubview(decreaseButton)
        addSubview(itemQuant)
        addSubview(increaseButton)
        
        
        itemNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        itemTypeLabel.anchor(top: itemNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton, itemQuant, increaseButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: itemNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 60, paddingBottom: 15, paddingRight: 45, width: 100, height: 70, enableInsets: false)
        
        
        increaseButton.addTarget(self, action: #selector(increaseFunc), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decreaseFunc), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

