import UIKit
class SignInPage: UIViewController, UITextFieldDelegate {

    private var emailTextField = TextFieldV0()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayOut()
    }
    
    private func setupUI() {
        view.backgroundColor = .blue
        emailTextField.delegate = self

        addLayouts()
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true) // Ocultar teclado cuando se toca fuera
    }

    // Sobrescribimos touchesBegan para detectar los toques fuera del UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        // Si el toque no está dentro del área del emailTextField, ocultamos el teclado
        if !emailTextField.frame.contains(touches.first!.location(in: view)) {
            view.endEditing(true) // Ocultar teclado
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Comenzó a editar el campo de texto")
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Terminó de editar el campo de texto")
    }

    private func setUpLayOut() {
        emailTextField.frame = UtilsFunc.responsiveCGRect(width: 343, height: 56, x: 16, y: 306)
    }
    
    private func addLayouts() {
        view.addSubview(emailTextField)
    }
}


class PaddedTextField: UITextField {
    let padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10) // Ajusta el padding como prefieras

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
