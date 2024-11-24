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
        dismissKeyboardWhenTappedAround()

        addLayouts()
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
