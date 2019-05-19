//
//  CollectionView.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//

import UIKit
class CollectionView<T,U:CollectionViewCell<T>>:CollectionViewWithHeader<T,Section<T>,U,CollectionViewHeaderCell<Section<T>>>{
    
    override func setUpViews(){
        sizeForHeader = .zero
    }
    var items: [T]!{
        didSet{
            sections = [Section<T>(items: items)]
        }
    }
    
}



class CollectionViewWithHeader<T,U:Section<T>,V:CollectionViewCell<T>,H:CollectionViewHeaderCell<U>>: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var sections = [U](){
        didSet{
            reloadData()
        }
    }
    init(flowLayout:UICollectionViewFlowLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        backgroundColor = .white
        delegate = self
        dataSource = self
        bounces = false
        register(V.self, forCellWithReuseIdentifier:"V")
        register(H.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "H")
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print(String(describing: self.description) + "deinit")
    }
    var action = { (title:String,image:UIImage,bgColor:UIColor,handler:@escaping UIContextualAction.Handler) -> UIContextualAction in
        let action =  UIContextualAction(style: .normal, title: title, handler: handler)
        action.image = image
        action.backgroundColor = bgColor
        return action
    }
    var indexPath:IndexPath?
    var sizeForRow = CGSize(width: UIScreen.main.bounds.width, height: 100)
    var sizeForHeader = CGSize(width: UIScreen.main.bounds.width, height: 50)
    
   
    func setUpViews(){
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "V", for: indexPath) as! V
        cell.item = sections[indexPath.section].items?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForRow
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return sizeForHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        view.layer.zPosition = -1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:  "H", for: indexPath) as! H
        view.item = sections[indexPath.section]
        return view
    }
}

