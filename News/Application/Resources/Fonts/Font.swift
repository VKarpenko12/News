//
//  AppFonts.swift
//  News
//
//  Created by Vitalii Karpenko on 9/13/21
//

import UIKit

enum Font {
    
    // MARK: - SF
    
    static func sfDisplayBold(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayBold(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplayBlack(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayBlack(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplayHeavy(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayHeavy(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplayLight(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayLight(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplayMedium(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayMedium(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplayRegular(size: CGFloat) -> UIFont {
        R.font.sfuiDisplayRegular(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfDisplaySemibold(size: CGFloat) -> UIFont {
        R.font.sfuiDisplaySemibold(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextBold(size: CGFloat) -> UIFont {
        R.font.sfuiTextBold(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextHeavy(size: CGFloat) -> UIFont {
        R.font.sfuiTextHeavy(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextRegularItalic(size: CGFloat) -> UIFont {
        R.font.sfProTextRegularItalic(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextBoldItalic(size: CGFloat) -> UIFont {
        R.font.sfuiTextBoldItalic(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextMedium(size: CGFloat) -> UIFont {
        R.font.sfuiTextMedium(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextRegular(size: CGFloat) -> UIFont {
        R.font.sfuiTextRegular(size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func sfTextSemibold(size: CGFloat) -> UIFont {
        R.font.sfuiTextSemibold(size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
