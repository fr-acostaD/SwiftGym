//
//  Extensions.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 25/11/24.
//

import UIKit

// MARK: UIColor

extension UIColor {
    convenience init?(hex: String) {
        // Elimino caracteres no deseados
        var hexCleaned = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexCleaned = hexCleaned.first == "#" ? String(hexCleaned.dropFirst()) : hexCleaned
        
        // Compruebo si el hexadecimal tiene transparencia (valor en el 'a')
        guard hexCleaned.count == 6 || hexCleaned.count == 8 else { return nil }
        
        guard let rgb: UInt64 = UInt64(hexCleaned, radix: 16) else { return nil}

        let r, g, b, a: CGFloat
        if hexCleaned.count == 6 {
            // Los numeros hexadecimales van de dos en dos digitos y cada digito corresponde 4 bits en binario
            // Se le pasa una mascara de bits don FF es equivalente a 1111 por lo que se copia el valor
            // Luego se mueve a la primera posicion de unidades.
            // Finalmente se divide en tre 255 para tener valor porcentual.
            
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            a = 1.0 // Opacidad predeterminada
        } else {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}


// MARK: UIImageView

extension UIImageView {
    static func createIcon(systemName: String, tintColor: UIColor = .gray, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        let iconView = UIImageView()
        iconView.image = UIImage(systemName: systemName)
        iconView.tintColor = tintColor
        iconView.contentMode = contentMode
        iconView.isUserInteractionEnabled = true
        return iconView
    }
}

// MARK: URLRequest

extension URLRequest {
    
    // Se pone mutating porque Endpoint es una estructura y esta tipologia a diferencia de las clases se pasan por copia profunda
    // lo que hace que todo cambio no influya en la original sino que se hace una copia. Por ello ponemos mutating para permitir esa referencia
    // y asi poder hacer modificaciones.
    mutating func addHeaders(from endpoint: Endpoint) {
        
        for (key, value) in endpoint.baseURL.headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
}


// MARK: UIViewController

extension UIViewController {

    func dismissKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: SignInPage

extension SignInPage {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let complete: () -> Void = textField.accionEditing {
            complete()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let complete: () -> Void = textField.accionEndEditing {
            complete()
        }
    }
}

// MARK: UITextField

extension UITextField {
    private struct AssociatedKeys {
        static var beginEditingClosure = "beginEditingClosure"
        static var endEditingClosure = "endEditingClosure"
    }

    // Swift no permite agregar una propiedad directamente a una clase que no has definido tú.
    // Sin embargo Objective-C si permite agregar propiedades adicionales en tiempo de ejecucion.
    // Se llama objetos asociados.
    
    var accionEditing: (() -> Void)? {
        
        // PARAMETROS:
        // 1º Objeto al que se le asociara una propiedad en tiempo de ejecucion
        // 2º Una clave unica pasada como puntero, para identificar cuando devolver y cuando asignar valor
        // 3º Un valor de retorno.
        // 4º Se especifica como ha de manejar la memoria. Ponemos COPY_ porque queremos que se creen instancias nuevas no se haga referencias
        // y por tanto se cambie el valor en cada asignacion. Se pone NONATOMIC para determinar que no hay concurrencia.
        
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.beginEditingClosure) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.beginEditingClosure, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    var accionEndEditing: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.endEditingClosure) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.endEditingClosure, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
