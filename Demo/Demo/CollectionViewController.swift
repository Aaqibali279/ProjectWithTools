//
//  CollectionViewController.swift
//  Demo
//
//  Created by osx on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//

import UIKit

class Cell: CollectionViewCell<Message> {
    override var item: Message!{
        didSet{
            titleLabel.text = item.title
            subtitleLabel.text = item.subTitle
        }
    }
    
    let imgView = UIImageView(image: #imageLiteral(resourceName: "celebrity"), contentMode: .scaleAspectFill)
    let titleLabel = UILabel(text: "Jennifier Lopez", font: .systemFont(ofSize: 15, weight: .bold))
    let subtitleLabel = UILabel(text: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals", font: .systemFont(ofSize: 15, weight: .regular),textColor:.gray,numberOfLines:3)
    
    override func setUpViews() {
        
        imgView.layer.cornerRadius = 32
        imgView.clipsToBounds = true
        
        hstack(imgView.withWidth(64).withHeight(64)
            ,stack(titleLabel,subtitleLabel
                ,spacing:4)
            ,spacing: 16
            ,alignment: .center).withMargins(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        
        addSeparator(leadingAnchor: titleLabel.leadingAnchor)
    }
}

class HeaderCell: CollectionViewHeaderCell<MySection> {
    override var item: MySection!{
        didSet{
            titleLabel.text = item.heading?.uppercased()
        }
    }
    let titleLabel = UILabel(text: "Jennifier Lopez", font: .systemFont(ofSize: 15, weight: .bold))
    
    override func setUpViews() {
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        addSubview(titleLabel)
        titleLabel.fillSuperview(padding: .allSides(16))
    }
}

struct Message {
    var title:String
    var subTitle:String
}

class MySection: Section<Message> {
    var heading:String?
    
    init(heading:String,items:[Message]) {
        self.heading = heading
        super.init(items: items)
    }
}


class CollectionViewController: UIViewController {
    
    let collectionView = { () -> CollectionViewWithHeader<Message,MySection,Cell,HeaderCell> in
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        return CollectionViewWithHeader<Message,MySection,Cell,HeaderCell>(flowLayout:flowLayout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CollectionView"
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        collectionView.sections = [
            MySection(heading: "Singers", items: [Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Salena Gomez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Britiny Spears", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals"),Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")]),
            MySection(heading: "Models", items: [Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Salena Gomez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Britiny Spears", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals"),Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")]),
            MySection(heading: "Celebrities", items: [Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Salena Gomez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")
                ,Message(title: "Britiny Spears", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals"),Message(title: "Jennifier Lopez", subTitle: "Born July 24, 1969, in the Bronx, New York, Lopez began her career as a dancer, appearing in stage musicals")])
        ]
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    }
    deinit {
        print(String(describing: self) + "deinit")
    }
}
