//
//  Color+Extension.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21.
//

import UIKit

extension UIColor {
    var redValue: CGFloat { return CIColor(color: self).red }
    var greenValue: CGFloat { return CIColor(color: self).green }
    var blueValue: CGFloat { return CIColor(color: self).blue }
    var alphaValue: CGFloat { return CIColor(color: self).alpha }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    static func interpolate(
        from: UIColor,
        to: UIColor,
        with fraction: CGFloat
    ) -> UIColor {
        let f = min(1, max(0, fraction))
        let c1 = from.components()
        let c2 = to.components()
        let r = c1.0 + (c2.0 - c1.0) * f
        let g = c1.1 + (c2.1 - c1.1) * f
        let b = c1.2 + (c2.2 - c1.2) * f
        let a = c1.3 + (c2.3 - c1.3) * f
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat) {
        guard let c = cgColor.components else { return (0, 0, 0, 1) }
        
        if (cgColor.numberOfComponents == 2) {
            return (c[0], c[0], c[0], c[1])
        }
        
        return (c[0], c[1], c[2], c[3])
    }
}
