//
//  TextFielsV0.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 14/11/24.
//
import UIKit

class TextFieldV0: UITextField {
    // MARK: - Constants
    
    // MARK: - Fields
    
    // MARK: - UI Components
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboard has been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Ingresa tu Correo"
    }
    // MARK: - Configuration Methods for Subcomponents
    
    // MARK: - Layout
    
    // MARK: - Add Actions
    
    
}
