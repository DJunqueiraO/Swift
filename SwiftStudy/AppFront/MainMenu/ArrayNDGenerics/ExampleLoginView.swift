//
//  ExampleLoginView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 10/01/23.
//

import UIKit

final class ExampleLoginView: UIView {
    
    private let emailLabel = Create.element.label("Lero Lero")
    
    private let uiTextField: UITextField = {
        let uiTextField = UITextField()
        uiTextField.backgroundColor = .blue
        return uiTextField
    }()
    
    private let passwordLabel: UITextField = {
        let passwordLabel = UITextField()
        passwordLabel.backgroundColor = .green
        return passwordLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVisualElements()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVisualElements() {
        
        self.addSubviews([emailLabel, uiTextField, passwordLabel])
        
        emailLabel.enableAutoLayout
            .constraint(attributesConstants: [.top: 95, .left: 12, .right: -12])
        
        uiTextField.enableAutoLayout
            .constraint(attribute: .bottom, to: emailLabel,constant: 50)
            .constraint(attributesConstants: [.left: 12, .right: -12])
        
        passwordLabel.enableAutoLayout
            .constraint(attribute: .bottom, to: uiTextField, constant: 60)
            .constraint(attributesConstants: [.left: 12, .right: -12])
    }
}
