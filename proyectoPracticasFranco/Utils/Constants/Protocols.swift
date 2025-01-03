//
//  Protocols.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//
import UIKit

protocol BaseURL {
    var url: String { get }
    var headers: [String : String] { get }
}

protocol CustomCardView: UIView {
    static var baseSize: CGSize { get set }
    func updateCardView(with cardData: Codable)
}

protocol FieldValidator {
    func validate(_ text: String) -> Bool
    func errorFunc(textField: UITextField, errorLabel: UILabel) -> Void

    var errorMessage: String { get }

}
