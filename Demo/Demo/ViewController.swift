//
//  ViewController.swift
//  Demo
//
//  Created by osx on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        
        let btn1 = UIButton(title: "CollectionView", titleColor: .white, backgroundColor: .black, target: self, action: #selector(push))
        let btn2 = UIButton(title: "TableView", titleColor: .white, backgroundColor: .black, target: self, action: #selector(push))
        
        let stack = UIStackView(arrangedSubviews: [btn1,btn2])
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.centerInSuperview()
        stack.withHeight(140).withWidth(150)
        
    }
    
    @objc func push(btn:UIButton){
        guard btn.title(for: .normal)! == "TableView" else {
            navigationController?.pushViewController(CollectionViewController(), animated: true)
            return
        }
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
}

