//
//  DialogType.swift
//  SmartWindow
//
//  Created by 정유진 on 2022/12/12.
//

import Foundation
import SwiftUI

public enum DialogType {
    public typealias Handler = DialogValueModel.Handler
    
    case success(model: DialogValueModel)
    case error(model: DialogValueModel)
    
    public func title() -> String {
        switch self {
        case . success(model: let model):
            return model.title
        case .error(model: let model):
            return model.title
        }
    }
    
    public func message() -> String {
        switch self {
        case . success(model: let model):
            return model.content
        case .error(model: let model):
            return model.content
        }
    }
    
    public var leftButtonAction: Handler {
        switch self {
        case .success(model: let model):
            return model.onPositiveButton
        case .error(model: let model):
            return model.onPositiveButton
        }
    }
    
    public var rightButtonAction: Handler {
        switch self {
        case .success(model: let model):
            return model.onNegativeButton
        case .error(model: let model):
            return model.onNegativeButton
        }
    }
    
    public var leftButtonText: String {
        switch self {
        case .success(model: let model):
            return model.positiveButton
        case .error(model: let model):
            return model.positiveButton
        }
    }
    
    public var rightButtonText: String {
        switch self {
        case .success(model: let model):
            return model.negativeButton
        case .error(model: let model):
            return model.negativeButton
        }
    }
    
    public var isVerticalButtonPresented: Bool {
        switch self {
        case .success(model: let model):
            return model.isVerticalButtonPresented
        case .error(model: let model):
            return model.isVerticalButtonPresented
        }
    }
    
    public func height() -> CGFloat {
        switch self {
        case .success(model: let model):
            return model.isVerticalButtonPresented ? 320: 270
        case .error(model: let model):
            return model.isVerticalButtonPresented ? 320 : 270
        }
    }
    
    
}
