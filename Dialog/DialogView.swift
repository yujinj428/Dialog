//
//  DialogView.swift
//  SmartWindow
//
//  Created by 정유진 on 2022/12/12.
//

import SwiftUI
import Combine

public struct DialogView: View {
    var viewModel = DialogViewModel()
    var presentDialog: Bool
    var dialogType: DialogType
    var textStyle: DialogTextStyle
    
    public init(presentDialog: Bool, dialogType: DialogType, textStyle: DialogTextStyle) {
        self.presentDialog = presentDialog
        self.dialogType = dialogType
        self.textStyle = textStyle
    }
    
    private let verticalButtonsHeight: CGFloat = 80
    typealias Handler = DialogValueModel.Handler
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                if dialogType.title() != "" {
                    VStack {
                        Text(dialogType.title())
                            .font(textStyle.title.fontFamily)
                            .foregroundColor(textStyle.title.foregroundColor)
                            .multilineTextAlignment(.leading)
                            .frame(height: 20)
                            .padding(.top, DialogConstants.spacing)
                            .padding(.bottom, DialogConstants.spacing)
                            .padding(.horizontal, DialogConstants.spacing)
                    }
                    .frame(minWidth: 0 , maxWidth:  .infinity, minHeight: 0, alignment: .leading)
                    .background(Color(hex: DialogConstants.KEBColor.primary.rawValue))
                }
                
                if dialogType.message() != "" {
                    Text(dialogType.message())
                        .frame(minWidth: 0 , maxWidth:  .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                        .font(textStyle.content.fontFamily)
                        .foregroundColor(textStyle.content.foregroundColor)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, DialogConstants.spacing)
                        .minimumScaleFactor(0.5)
                }
                
                Divider()
                    .frame(minWidth: 0 , maxWidth:  .infinity, minHeight: 0, maxHeight: 0.5)
                    .padding(.all, 0)
                
                // 버튼을 horizontal axis로 쌓는 경우
                if !dialogType.isVerticalButtonPresented{
                    HStack(spacing: 0) {
                        // positive (default)
                        Button {
//                            if let handler = dialogType.leftButtonAction {
//                                handler(self)
//                            }
                        } label: {
                            Text(dialogType.leftButtonText)
                                .font(textStyle.leftButton.fontFamily)
                                .foregroundColor(textStyle.leftButton.foregroundColor)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, DialogConstants.spacing*1.5)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 42)
                        }
                        .background(textStyle.leftButton.backgroundColor)
                        
                        if !dialogType.rightButtonText.isEmpty {
                            Button {
//                                if let handler = dialogType.leftButtonAction {
//                                    handler(self)
//                                }
                            } label: {
                                Text(dialogType.rightButtonText)
                                    .font(textStyle.rightButton.fontFamily)
                                    .foregroundColor(textStyle.rightButton.foregroundColor)
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, DialogConstants.spacing*1.5)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 42)
                            }
                            .background(textStyle.rightButton.backgroundColor)
                        }
                    }
                    
                    
                }
            }
            .frame(width: 480, height: dialogType.height())
            .background(Color.white)
            .cornerRadius(4)
        }
    }
}

struct DialogsView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(presentDialog: true,
                   dialogType: .success(
                    model: DialogValueModel(title: "Dialog Title",
                                            content: "Dialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialogContentDialog ContentDialog ContentDialog ContentDialog ContentDialog  ContentDialog ContentDialog ContentDialogContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialogContentDialog ContentDialog ContentDialog ContentDialog ContentDialog ContentDialog Content",
                                            positiveButton: "confirm",
                                            negativeButton: "cancel",
                                            onPositiveButton: {(dialogView) in
                                                guard var view = dialogView as? DialogView else { return }
                                                view.presentDialog = false
                                                
                                            })
                   ),
                   textStyle: DialogTextStyle())
    }
}
