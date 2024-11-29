//
//  SignInPage 2.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 27/11/24.
//


import UIKit
class SignUpPage: UIViewController, UITextFieldDelegate {

    // MARK: - Constants
    
    // MARK: - Fields
    
    // MARK: - UI Components
    private var headerIcon = UIImage()
    
    private var emailTextField = TextFieldV0(fieldType: .email)
    private var passwordTextField = TextFieldV0(fieldType: .password, hasValidation: false)
    private var confirmPasswordTextField = TextFieldV0(fieldType: .password, hasValidation: false)

    private let headerText0 = UILabel()
    private let headerText1 = UILabel()
    private let emailHeader = UILabel()
    private let passwordHeader = UILabel()
    private let confirmPasswordHeader = UILabel()

    private let acountHeader = UILabel()
    private let SignInHeader = UILabel()
    
    private var iconView: UIImageView?
    private let iconBlocK = UIView()
    private let buttonSignIn = UIView()
    private let buttonText = UILabel()
    private var buttonIcon: UIImageView?
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpAction()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayOut()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .white
        textFieldSetUp()
        textSetUp()
        iconButtonSetUp()
        dismissKeyboardWhenTappedAround()

        addLayouts()
    }
    
    // MARK: - Configuration Methods for Subcomponents
    private func iconButtonSetUp() {
        iconBlocK.backgroundColor = .systemOrange
        iconView = UIImageView.createIcon(systemName: "envelope", tintColor: .white, contentMode: .center)
        
        buttonSignIn.backgroundColor = .black
        buttonIcon = UIImageView.createIcon(systemName: "arrow.right", tintColor: .white)
        buttonText.textColor = .white
        buttonText.text = "Sign In"

    }

    private func textFieldSetUp() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func textSetUp(){
        headerText0.textAlignment = .center
        headerText0.textColor = UIColor(hex: "111214")
        headerText0.text = "Sign Up For Free"
        
        headerText1.textAlignment = .center
        headerText1.textColor = UIColor(hex: "393C43")
        headerText1.text = "Quickly make your account in 1 minute"
        
        emailHeader.textAlignment = .center
        emailHeader.textColor = UIColor(hex: "111214")
        emailHeader.text = "Email Address"
        
        passwordHeader.textAlignment = .center
        passwordHeader.textColor = UIColor(hex: "111214")
        passwordHeader.text = "Password"
        
        confirmPasswordHeader.textAlignment = .center
        confirmPasswordHeader.textColor = UIColor(hex: "111214")
        confirmPasswordHeader.text = "Confirm Password"

        acountHeader.textAlignment = .center
        acountHeader.textColor = UIColor(hex: "676C75")
        acountHeader.text = "Already have an account?"
        
        SignInHeader.textAlignment = .center
        SignInHeader.textColor = UIColor(hex: "F97316")
        SignInHeader.attributedText = NSAttributedString(
            string: "Sign In.",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }

    // MARK: - Layout
    private func setUpLayOut() {
        // Frames
        frameSetUp()
        // Borders
        borderSetUp()
        // Font Sizes
        updateFonts()
    }
    
    private func frameSetUp() {
        emailTextField.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(308))
        passwordTextField.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(416))
        confirmPasswordTextField.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(524))
        headerText0.frame = UtilsFunc.responsiveCGRect(width: 343, height: 38, x: 16, y: 160)
        headerText1.frame = UtilsFunc.responsiveCGRect(width: 343, height: 24, x: 16, y: 206)
        emailHeader.frame = UtilsFunc.responsiveCGRect(width: 100, height: 13, x: 16, y: 280)
        passwordHeader.frame = UtilsFunc.responsiveCGRect(width: 68, height: 13, x: 16, y: 388)
        confirmPasswordHeader.frame = UtilsFunc.responsiveCGRect(width: 130, height: 13, x: 16, y: 496)
        acountHeader.frame = UtilsFunc.responsiveCGRect(width: 170, height: 20, x: 80, y: 752)
        SignInHeader.frame = UtilsFunc.responsiveCGRect(width: 56, height: 20, x: 250, y: 752)
        iconBlocK.frame = UtilsFunc.responsiveCGRect(width: 48, height: 48, x: 163.5, y: 96)
        iconView!.frame.size = CGSize(width: UtilsFunc.doResponsive(24), height: UtilsFunc.doResponsive(24))
        iconView?.center = CGPoint(x: iconBlocK.bounds.midX, y: iconBlocK.bounds.midY)
        buttonSignIn.frame = UtilsFunc.responsiveCGRect(width: 343, height: 56, x: 16, y: 664)
        buttonText.frame = UtilsFunc.responsiveCGRect(width: 60, height: 24, x: 127, y: 16)
        buttonIcon!.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 192, y: 16)
    }
    
    private func borderSetUp() {
        iconBlocK.layer.cornerRadius = UtilsFunc.doResponsive(20)
        buttonSignIn.layer.cornerRadius = UtilsFunc.doResponsive(20)
    }
    
    private func updateFonts() {
        headerText0.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(30), weight: .bold)
        headerText1.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .regular)
        emailHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        passwordHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        confirmPasswordHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        acountHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .medium)
        SignInHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .medium)
        buttonText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .semibold)
    }
    
    private func addLayouts() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)

        view.addSubview(headerText0)
        view.addSubview(headerText1)
        view.addSubview(emailHeader)
        view.addSubview(passwordHeader)
        view.addSubview(confirmPasswordHeader)
        view.addSubview(acountHeader)
        view.addSubview(SignInHeader)
        view.addSubview(iconBlocK)
        iconBlocK.addSubview(iconView!)
        view.addSubview(buttonSignIn)
        buttonSignIn.addSubview(buttonText)
        buttonSignIn.addSubview(buttonIcon!)
    }
    
    // MARK: - Add Actions
    
    private func setUpAction() {
        passwordConfirmAction()
    }
    
    func passwordConfirmAction(){
        confirmPasswordTextField.accionEndEditing = {
            self.setTexfieldAction(elemento: (self.passwordTextField, self.confirmPasswordTextField))
        }
        
        passwordTextField.accionEndEditing = {
                self.passwordTextField.layer.borderWidth = 0
                self.passwordTextField.layer.shadowRadius = 0
        }
    }
    
    private func setTexfieldAction<T: TextFieldV0, U: TextFieldV0>(elemento: (T, U)) -> Void {
        if (elemento.0.text?.isEmpty ?? true) && (elemento.1.text?.isEmpty ?? true) {
            elemento.1.layer.borderWidth = 0
            elemento.1.layer.shadowRadius = 0
            return
        }
        
        if (elemento.0.text != elemento.1.text) {
            elemento.0.showError()
            elemento.1.showError()
        } else {
            elemento.0.layer.borderColor = UIColor.green.cgColor
            elemento.0.layer.shadowColor = UIColor.green.cgColor
            elemento.1.layer.borderColor = UIColor.green.cgColor
            elemento.1.layer.shadowColor = UIColor.green.cgColor
            if  elemento.0.layer.borderWidth == 0 {
                elemento.0.layer.borderWidth = UtilsFunc.doResponsive(2)
                elemento.0.layer.shadowRadius = UtilsFunc.doResponsive(10)

            }
        }
    }
}




