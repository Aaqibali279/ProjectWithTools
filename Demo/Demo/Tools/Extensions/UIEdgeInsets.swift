//
//  UIEdgeInsets.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/05/19.
//  Copyright © 2019 athenasoft. All rights reserved.
//

import UIKit
extension UIEdgeInsets {
    static public func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
