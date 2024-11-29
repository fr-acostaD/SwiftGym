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
    var isValid: Bool?
    var leftIcon: String?
    var rightIcon: String?
    private let hasvalidation: Bool
    private var fieldType: TextFieldType
    private var validator:FieldValidator?
    
    // MARK: - UI Components
    private let errorLabel = UILabel()
    
    // MARK: - Initializers
    init(fieldType: TextFieldType = .plain, hasValidation: Bool = true) {
        self.fieldType = fieldType
        self.hasvalidation = hasValidation
        super.init(frame: .zero)
        setupView()
        setUpActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboard has been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        

        layer.shadowOpacity = 0.4 // Opacidad de la sombra (ajustar para intensidad)
        layer.shadowOffset = CGSize(width: 0, height: 0)  // Desplazamiento de la sombra (horizontal, vertical)
        
        self.layer.borderWidth = 0
        self.layer.shadowRadius = 0
        
        textColor = .label
        tintColor = .label
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = false
        minimumFontSize = 12
        
        backgroundColor = UIColor(hex: "F3F3F4")
        autocorrectionType = .no
        configureForFieldType()
    }
    
    // MARK: - Configuration Methods for Subcomponents
        
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)
        
        return bounds.inset(by: self.padding ?? defaultPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)

        return bounds.inset(by: self.padding ?? defaultPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let defaultPadding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)

        return bounds.inset(by: self.padding ?? defaultPadding)
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Self SetUp
        self.frame.size = CGSize(width: UtilsFunc.doResponsive(343), height: UtilsFunc.doResponsive(56))
        // Borders
        borderSetUp()
    }

    private func borderSetUp(){
        layer.cornerRadius = UtilsFunc.doResponsive(20)
    }
    
    // MARK: - Add Actions
    private func setUpActions() {
        accionEditing = {
            self.layer.borderColor = UIColor(hex: "F97316")?.cgColor
            self.layer.shadowColor = UIColor(hex: "F97316")?.cgColor  // Color de la sombra
            
            self.layer.borderWidth = UtilsFunc.doResponsive(2)
            self.layer.shadowRadius = UtilsFunc.doResponsive(10)
        }

        accionEndEditing = {
            if self.hasvalidation {
                self.isValid = self.validate()
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
        self.rightView?.addGestureRecognizer(tapGesture)
    }
    
    private func validate() -> Bool{
        guard let text = self.text else { return false }
        if !(validator?.validate(text) ?? false) {
                if text.isEmpty {
                    self.layer.borderWidth = 0
                    self.layer.shadowRadius = 0
                    return false }
                showError()
                return false
            }
        layer.borderColor = UIColor.green.cgColor
        layer.shadowColor = UIColor.green.cgColor
        return true
    }
    
    private func configureForFieldType() {
        switch self.fieldType {
        case .email:
            keyboardType = .emailAddress
            autocapitalizationType = .none
            placeholder = "Enter your email"
                        
            leftView = SideIconCustom(
                iconView: UIImageView.createIcon(systemName: "envelope", tintColor: .black)
            )
            leftViewMode = .always
            self.validator = EmailValidator()
            
        case .password:
            isSecureTextEntry = true
            placeholder = "Enter your password"
            
            leftView = SideIconCustom(
                iconView: UIImageView.createIcon(systemName: leftIcon ?? "envelope", tintColor: .black)
            )
            leftViewMode = .always
            
            rightView = SideIconCustom(
                iconView: UIImageView.createIcon(systemName: rightIcon ?? "eye", tintColor: .black, contentMode: .center)
            )
            rightViewMode = .always
            
            self.validator = PasswordValidator()
            
        case .phone:
            keyboardType = .phonePad
            placeholder = "Enter your phone number"
            self.validator = LengthValidator(minLength: 10, maxLength: 15)
            
        case .plain:
            keyboardType = .default
            placeholder = "Enter text"
        }
    }
    func showError() {
        validator?.errorFunc(textField: self, errorLabel: errorLabel)
    }
    
    @objc private func togglePasswordVisibility() {
        self.isSecureTextEntry.toggle()
        (rightView?.subviews.first as! UIImageView).image = self.isSecureTextEntry ? UIImage(systemName: "eye")
 : UIImage(systemName: "eye.slash")
    }
}
