//
//  DialogStyle.swift
//  SmartWindow
//
//  Created by 정유진 on 2022/12/12.
//

import Foundation
import SwiftUI

protocol TextStyle {
    var fontFamily: Font {get set}
    var foregroundColor: Color {get set}
}

public struct DialogTextStyle {
    var title = DialogTitleStyle()
    var content = DialogContentStyle()
    var leftButton = DialogButtonStyle()
    var rightButton = DialogButtonStyle(foregroundColor: Color(hex: DialogConstants.KEBColor.primary.rawValue),
                                        backgroundColor: Color(UIColor.systemBackground))
    
    public init(title: DialogTitleStyle = DialogTitleStyle(), content: DialogContentStyle = DialogContentStyle(), leftButton: DialogButtonStyle = DialogButtonStyle(), rightButton: DialogButtonStyle = DialogButtonStyle(foregroundColor: Color(hex: DialogConstants.KEBColor.primary.rawValue),
                                                                                                                                                                                                                backgroundColor: Color(UIColor.systemBackground))) {
        self.title = title
        self.content = content
        self.leftButton = leftButton
        self.rightButton = rightButton
    }
    
    public struct DialogTitleStyle: TextStyle {
        var fontFamily: Font
        var foregroundColor: Color
        
        public init(fontFamily: Font = .system(size: 16, weight: .bold),
             foregroundColor: Color = .white) {
            self.fontFamily = fontFamily
            self.foregroundColor = foregroundColor
        }
    }
    
    public struct DialogContentStyle: TextStyle {
        var fontFamily: Font
        var foregroundColor: Color
        
        public init(fontFamily: Font = .system(size: 12, weight: .regular),
             foregroundColor: Color = Color(UIColor.label)) {
            self.fontFamily = fontFamily
            self.foregroundColor = foregroundColor
        }
    }
    
    public struct DialogButtonStyle: TextStyle {
        var fontFamily: Font
        var foregroundColor: Color
        var backgroundColor: Color
        
        public init(fontFamily: Font = .system(size: 16, weight: .regular),
             foregroundColor: Color = .white,
             backgroundColor: Color = Color(hex: DialogConstants.KEBColor.primary.rawValue)) {
            self.fontFamily = fontFamily
            self.foregroundColor = foregroundColor
            self.backgroundColor = backgroundColor
        }
    }
}
