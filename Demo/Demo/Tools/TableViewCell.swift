//
//  TableViewCell.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//

import UIKit
class TableViewCell<U>: UITableViewCell {
    
    var item:U!
    
    let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func addSeparator(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: leftPadding, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    }
    open func addSeparator(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 0.5))
    }
    
    func setUpViews(){
        
    }
    
    
    
}


class TableViewHeaderCell<U>: UITableViewHeaderFooterView {
    
    var item:U!
    
    let separatorView = UIView(backgroundColor: UIColor(white: 0.6, alpha: 0.5))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUpViews(){
        
    }
    
    
    
}
