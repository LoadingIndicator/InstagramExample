//
//  UIFont+Accessibility.swift
//  InstagramExample
//
//  Created by Nicolas Spinner on 21.12.20.
//

import UIKit

extension UIFont {

    static func scaledSystemFont(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        .systemFont(ofSize: UIFontMetrics.default.scaledValue(for: size), weight: weight)
    }

}
