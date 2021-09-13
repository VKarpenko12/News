//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 14 files.
  struct file {
    /// Resource file `SF-Display-Black.ttf`.
    static let sfDisplayBlackTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Black", pathExtension: "ttf")
    /// Resource file `SF-Display-Bold.ttf`.
    static let sfDisplayBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Bold", pathExtension: "ttf")
    /// Resource file `SF-Display-Heavy.ttf`.
    static let sfDisplayHeavyTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Heavy", pathExtension: "ttf")
    /// Resource file `SF-Display-Light.ttf`.
    static let sfDisplayLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Light", pathExtension: "ttf")
    /// Resource file `SF-Display-Medium.ttf`.
    static let sfDisplayMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Medium", pathExtension: "ttf")
    /// Resource file `SF-Display-Regular.ttf`.
    static let sfDisplayRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Regular", pathExtension: "ttf")
    /// Resource file `SF-Display-Semibold.ttf`.
    static let sfDisplaySemiboldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Display-Semibold", pathExtension: "ttf")
    /// Resource file `SF-Text-Bold.ttf`.
    static let sfTextBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-Bold", pathExtension: "ttf")
    /// Resource file `SF-Text-BoldItalic.ttf`.
    static let sfTextBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-BoldItalic", pathExtension: "ttf")
    /// Resource file `SF-Text-Heavy.ttf`.
    static let sfTextHeavyTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-Heavy", pathExtension: "ttf")
    /// Resource file `SF-Text-Medium.ttf`.
    static let sfTextMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-Medium", pathExtension: "ttf")
    /// Resource file `SF-Text-Regular.ttf`.
    static let sfTextRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-Regular", pathExtension: "ttf")
    /// Resource file `SF-Text-RegularItalic.ttf`.
    static let sfTextRegularItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-RegularItalic", pathExtension: "ttf")
    /// Resource file `SF-Text-Semibold.ttf`.
    static let sfTextSemiboldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Text-Semibold", pathExtension: "ttf")

    /// `bundle.url(forResource: "SF-Display-Black", withExtension: "ttf")`
    static func sfDisplayBlackTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayBlackTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Bold", withExtension: "ttf")`
    static func sfDisplayBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Heavy", withExtension: "ttf")`
    static func sfDisplayHeavyTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayHeavyTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Light", withExtension: "ttf")`
    static func sfDisplayLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Medium", withExtension: "ttf")`
    static func sfDisplayMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Regular", withExtension: "ttf")`
    static func sfDisplayRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplayRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Display-Semibold", withExtension: "ttf")`
    static func sfDisplaySemiboldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfDisplaySemiboldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-Bold", withExtension: "ttf")`
    static func sfTextBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-BoldItalic", withExtension: "ttf")`
    static func sfTextBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-Heavy", withExtension: "ttf")`
    static func sfTextHeavyTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextHeavyTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-Medium", withExtension: "ttf")`
    static func sfTextMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-Regular", withExtension: "ttf")`
    static func sfTextRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-RegularItalic", withExtension: "ttf")`
    static func sfTextRegularItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextRegularItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Text-Semibold", withExtension: "ttf")`
    static func sfTextSemiboldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfTextSemiboldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 14 fonts.
  struct font: Rswift.Validatable {
    /// Font `SFProText-RegularItalic`.
    static let sfProTextRegularItalic = Rswift.FontResource(fontName: "SFProText-RegularItalic")
    /// Font `SFUIDisplay-Black`.
    static let sfuiDisplayBlack = Rswift.FontResource(fontName: "SFUIDisplay-Black")
    /// Font `SFUIDisplay-Bold`.
    static let sfuiDisplayBold = Rswift.FontResource(fontName: "SFUIDisplay-Bold")
    /// Font `SFUIDisplay-Heavy`.
    static let sfuiDisplayHeavy = Rswift.FontResource(fontName: "SFUIDisplay-Heavy")
    /// Font `SFUIDisplay-Light`.
    static let sfuiDisplayLight = Rswift.FontResource(fontName: "SFUIDisplay-Light")
    /// Font `SFUIDisplay-Medium`.
    static let sfuiDisplayMedium = Rswift.FontResource(fontName: "SFUIDisplay-Medium")
    /// Font `SFUIDisplay-Regular`.
    static let sfuiDisplayRegular = Rswift.FontResource(fontName: "SFUIDisplay-Regular")
    /// Font `SFUIDisplay-Semibold`.
    static let sfuiDisplaySemibold = Rswift.FontResource(fontName: "SFUIDisplay-Semibold")
    /// Font `SFUIText-BoldItalic`.
    static let sfuiTextBoldItalic = Rswift.FontResource(fontName: "SFUIText-BoldItalic")
    /// Font `SFUIText-Bold`.
    static let sfuiTextBold = Rswift.FontResource(fontName: "SFUIText-Bold")
    /// Font `SFUIText-Heavy`.
    static let sfuiTextHeavy = Rswift.FontResource(fontName: "SFUIText-Heavy")
    /// Font `SFUIText-Medium`.
    static let sfuiTextMedium = Rswift.FontResource(fontName: "SFUIText-Medium")
    /// Font `SFUIText-Regular`.
    static let sfuiTextRegular = Rswift.FontResource(fontName: "SFUIText-Regular")
    /// Font `SFUIText-Semibold`.
    static let sfuiTextSemibold = Rswift.FontResource(fontName: "SFUIText-Semibold")

    /// `UIFont(name: "SFProText-RegularItalic", size: ...)`
    static func sfProTextRegularItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProTextRegularItalic, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Black", size: ...)`
    static func sfuiDisplayBlack(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayBlack, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Bold", size: ...)`
    static func sfuiDisplayBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayBold, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Heavy", size: ...)`
    static func sfuiDisplayHeavy(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayHeavy, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Light", size: ...)`
    static func sfuiDisplayLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayLight, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Medium", size: ...)`
    static func sfuiDisplayMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayMedium, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Regular", size: ...)`
    static func sfuiDisplayRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplayRegular, size: size)
    }

    /// `UIFont(name: "SFUIDisplay-Semibold", size: ...)`
    static func sfuiDisplaySemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiDisplaySemibold, size: size)
    }

    /// `UIFont(name: "SFUIText-Bold", size: ...)`
    static func sfuiTextBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextBold, size: size)
    }

    /// `UIFont(name: "SFUIText-BoldItalic", size: ...)`
    static func sfuiTextBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextBoldItalic, size: size)
    }

    /// `UIFont(name: "SFUIText-Heavy", size: ...)`
    static func sfuiTextHeavy(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextHeavy, size: size)
    }

    /// `UIFont(name: "SFUIText-Medium", size: ...)`
    static func sfuiTextMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextMedium, size: size)
    }

    /// `UIFont(name: "SFUIText-Regular", size: ...)`
    static func sfuiTextRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextRegular, size: size)
    }

    /// `UIFont(name: "SFUIText-Semibold", size: ...)`
    static func sfuiTextSemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfuiTextSemibold, size: size)
    }

    static func validate() throws {
      if R.font.sfProTextRegularItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProText-RegularItalic' could not be loaded, is 'SF-Text-RegularItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayBlack(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Black' could not be loaded, is 'SF-Display-Black.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Bold' could not be loaded, is 'SF-Display-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayHeavy(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Heavy' could not be loaded, is 'SF-Display-Heavy.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Light' could not be loaded, is 'SF-Display-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Medium' could not be loaded, is 'SF-Display-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplayRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Regular' could not be loaded, is 'SF-Display-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiDisplaySemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIDisplay-Semibold' could not be loaded, is 'SF-Display-Semibold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-Bold' could not be loaded, is 'SF-Text-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-BoldItalic' could not be loaded, is 'SF-Text-BoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextHeavy(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-Heavy' could not be loaded, is 'SF-Text-Heavy.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-Medium' could not be loaded, is 'SF-Text-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-Regular' could not be loaded, is 'SF-Text-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfuiTextSemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFUIText-Semibold' could not be loaded, is 'SF-Text-Semibold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `currentSelectedIcon`.
    static let currentSelectedIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "currentSelectedIcon")
    /// Image `current`.
    static let current = Rswift.ImageResource(bundle: R.hostingBundle, name: "current")
    /// Image `otherSelectedIcon`.
    static let otherSelectedIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "otherSelectedIcon")
    /// Image `other`.
    static let other = Rswift.ImageResource(bundle: R.hostingBundle, name: "other")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "current", bundle: ..., traitCollection: ...)`
    static func current(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.current, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "currentSelectedIcon", bundle: ..., traitCollection: ...)`
    static func currentSelectedIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.currentSelectedIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "other", bundle: ..., traitCollection: ...)`
    static func other(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.other, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "otherSelectedIcon", bundle: ..., traitCollection: ...)`
    static func otherSelectedIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.otherSelectedIcon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
