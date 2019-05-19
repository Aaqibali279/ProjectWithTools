//
//  TableView.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//



import UIKit
class TableView<T,U:TableViewCell<T>>:TableViewWithHeader<T,Section<T>,U,TableViewHeaderCell<Section<T>>>{
    
    override func setUpViews(){
        heightForHeader = 0
    }
    var items: [T]!{
        didSet{
            sections = [Section<T>(items: items)]
        }
    }
    
}

class Section<U>{
    var items:[U]?
    init(items:[U]) {
        self.items = items
    }
}

class TableViewWithHeader<T,U:Section<T>,V:TableViewCell<T>,H:TableViewHeaderCell<U>>: UITableView,UITableViewDelegate,UITableViewDataSource{
    
    var sections = [U](){
        didSet{
            reloadData()
        }
    }
    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        bounces = false
        register(V.self, forCellReuseIdentifier:"V")
        register(H.self, forHeaderFooterViewReuseIdentifier: "H")
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
    var heightForRow:CGFloat = 100
    var heightForHeader:CGFloat = 50
    private var canEditRow:Bool = false
    var actions:[UIContextualAction]?{
        didSet{
            canEditRow = true
        }
    }
    func setUpViews(){
        
    }
    override func didMoveToSuperview() {
        separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRow
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        self.indexPath = indexPath
        guard let actions = actions else {return nil}
        return UISwipeActionsConfiguration(actions: actions)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "V", for: indexPath) as! V
        cell.item = sections[indexPath.section].items?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeader
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "H") as! H
        view.item = sections[section]
        return view
    }
}
