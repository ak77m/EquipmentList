//
//  NSImage.swift
//  EquipmentList (macOS)
//
//  Created by ak77m on 13.05.2021.
//

import Cocoa

typealias UIImage = NSImage

// To use NSImage as UIImage
// This lifehack works only with simple tasks

extension NSImage {
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)

        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }

//    convenience init?(named name: String) {
//        self.init(named: Name(name))
//   }
}


