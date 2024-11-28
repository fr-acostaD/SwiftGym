//
//  ValidatorsTextsFields.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 27/11/24.
//

import UIKit


struct EmailValidator: FieldValidator {
    func errorFunc(textField: UITextField, errorLabel: UILabel) {
        errorLabel.text = errorMessage
        errorLabel.textColor = .red
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.shadowColor = UIColor.red.cgColor
    }
    
    
    let errorMessage = "Invalid email address"
    
    func funcError( borderColor: inout CGColor, shadowColor: inout CGColor, errorLabel: inout UILabel) {

    }

    func validate(_ text: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: text)
    }
    
}

struct PasswordValidator: FieldValidator {
    func errorFunc(textField: UITextField, errorLabel: UILabel) {
        errorLabel.text = errorMessage
        errorLabel.textColor = .red
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.shadowColor = UIColor.red.cgColor
    }
    
    let errorMessage = "Password must be at least 8 characters long, with one uppercase letter and one number"

    func validate(_ text: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&#]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: text)
    }
}

struct LengthValidator: FieldValidator {
    func errorFunc(textField: UITextField, errorLabel: UILabel) {
    }
    
    let minLength: Int
    let maxLength: Int
    var errorFunc: (() -> Void)?

    var errorMessage: String {
        "Text must be between \(minLength) and \(maxLength) characters"
    }

    func validate(_ text: String) -> Bool {
        return text.count >= minLength && text.count <= maxLength
    }
}
