//
//  DialogValueModel.swift
//  SmartWindow
//
//  Created by 정유진 on 2022/12/12.
//

import Foundation
import SwiftUI
import Combine

public struct DialogValueModel {
    public typealias Handler = ((_ viewModel: any ObservableObject) -> ())?
    
    public var title: String
    public var content: String
    public var positiveButton: String
    public var negativeButton: String
    public var onPositiveButton: Handler
    public var onNegativeButton: Handler
    public var isVerticalButtonPresented: Bool
    
    public init(title: String = "",
         content: String = "",
         positiveButton: String = "",
         negativeButton: String = "",
         onPositiveButton: Handler = nil,
         onNegativeButton: Handler = nil,
         isVerticalButtonPresented: Bool = false) {
        self.title = title
        self.content = content
        self.positiveButton = positiveButton
        self.negativeButton = negativeButton
        self.onPositiveButton = onPositiveButton
        self.onNegativeButton = onNegativeButton
        self.isVerticalButtonPresented = isVerticalButtonPresented
    }
}
