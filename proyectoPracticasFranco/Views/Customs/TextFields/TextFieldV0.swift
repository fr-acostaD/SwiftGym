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
    private var padding: UIEdgeInsets?

    // MARK: - UI Components
    
    // MARK: - Initializers
    init() {
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
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Ingresa tu Correo"
        setupIcon()
    }
    // MARK: - Configuration Methods for Subcomponents
    private func setupIcon() {
        let iconView = UIImageView(image: UIImage(systemName: "envelope")) // Usa tu icono preferido aquí
        let iconPadding = 15
        iconView.tintColor = .gray
        iconView.contentMode = .center
        iconView.frame = CGRect(x: iconPadding, y: 0, width: 30, height: 30) // Agregar padding al icono

        // Usamos un contenedor para el icono
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: iconPadding + 30, height: 30))
        iconContainerView.addSubview(iconView)

        leftView = iconContainerView
        leftViewMode = .always
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 10)
        
        return bounds.inset(by: self.padding ?? defaultPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 10)

        return bounds.inset(by: self.padding ?? defaultPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 10)

        return bounds.inset(by: self.padding ?? defaultPadding)
    }
    
    // MARK: - Layout
    
    // MARK: - Add Actions
    
    
}

extension UIViewController {

    func dismissKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
