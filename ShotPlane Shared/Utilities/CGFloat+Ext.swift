//
//  CGFloat+Ext.swift
//  ShotPlane iOS
//
//  Created by Trương Quốc Tài on 11/09/2021.
//

import CoreGraphics

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
