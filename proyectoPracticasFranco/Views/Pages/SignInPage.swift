import UIKit
class SignInPage: UIViewController, UITextFieldDelegate {

    // MARK: - Constants
    
    // MARK: - Fields
    
    // MARK: - UI Components
    private var headerIcon = UIImage()
    
    private var emailTextField = TextFieldV0()
    private var passwordTextField = TextFieldV0()

    private let headerText0 = UILabel()
    private let headerText1 = UILabel()
    private let emailHeader = UILabel()
    private let passwordHeader = UILabel()
    private let acountHeader = UILabel()
    private let SignInHeader = UILabel()
    private let forgotPasswordHeader = UILabel()

    private var iconView: UIImageView?
    private let iconBlocK = UIView()
    private let buttonSignIn = UIView()
    private let buttonText = UILabel()
    private var buttonIcon: UIImageView?
    
    private let socialMediaSignIn0 = UIView()
    private var iconMedia0: UIImageView?

    private let socialMediaSignIn1 = UIView()
    private var iconMedia1: UIImageView?

    private let socialMediaSignIn2 = UIView()
    private var iconMedia2: UIImageView?

    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        
        iconMedia0 = UIImageView.createIcon(systemName: "envelope", tintColor: UIColor(hex: "393C43")!)
        iconMedia1 = UIImageView.createIcon(systemName: "envelope", tintColor: UIColor(hex: "393C43")!)
        iconMedia2 = UIImageView.createIcon(systemName: "envelope", tintColor: UIColor(hex: "393C43")!)

        MediaSignInConfig(MediaButton: socialMediaSignIn0)
        MediaSignInConfig(MediaButton: socialMediaSignIn1)
        MediaSignInConfig(MediaButton: socialMediaSignIn2)

    }
    
    private func MediaSignInConfig(MediaButton: UIView) -> Void{
        MediaButton.backgroundColor = .white
        MediaButton.layer.borderColor = UIColor(hex: "BABBBE")?.cgColor
    }
    
    private func textFieldSetUp() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.icon = "envelope"
        passwordTextField.icon =  "password"
        
        let iconView = UIImageView.createIcon(systemName: "eye", tintColor: .black)
        passwordTextField.rightView = iconView
        passwordTextField.rightViewMode = .always
    }
    
    private func textSetUp(){
        headerText0.textAlignment = .center
        headerText0.textColor = UIColor(hex: "111214")
        headerText0.text = "Sign In To NTTFit"
        
        headerText1.textAlignment = .center
        headerText1.textColor = UIColor(hex: "393C43")
        headerText1.text = "Let’s get started your fitness journey!"
        
        emailHeader.textAlignment = .center
        emailHeader.textColor = UIColor(hex: "111214")
        emailHeader.text = "Email Address"
        
        passwordHeader.textAlignment = .center
        passwordHeader.textColor = UIColor(hex: "111214")
        passwordHeader.text = "Password"
        
        acountHeader.textAlignment = .center
        acountHeader.textColor = UIColor(hex: "676C75")
        acountHeader.text = "Don’t have an account?"
        
        SignInHeader.textAlignment = .center
        SignInHeader.textColor = UIColor(hex: "F97316")
        SignInHeader.attributedText = NSAttributedString(
            string: "Sign Up.",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        forgotPasswordHeader.textAlignment = .center
        forgotPasswordHeader.textColor = UIColor(hex: "F97316")
        forgotPasswordHeader.attributedText = NSAttributedString(
            string: "Forgot Password",
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
        passwordTextField.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(448))
        headerText0.frame = UtilsFunc.responsiveCGRect(width: 343, height: 38, x: 16, y: 160)
        headerText1.frame = UtilsFunc.responsiveCGRect(width: 343, height: 24, x: 16, y: 206)
        emailHeader.frame = UtilsFunc.responsiveCGRect(width: 100, height: 13, x: 16, y: 282)
        passwordHeader.frame = UtilsFunc.responsiveCGRect(width: 68, height: 13, x: 16, y: 418)
        acountHeader.frame = UtilsFunc.responsiveCGRect(width: 158, height: 20, x: 80, y: 723)
        SignInHeader.frame = UtilsFunc.responsiveCGRect(width: 56, height: 20, x: 242, y: 723)
        forgotPasswordHeader.frame = UtilsFunc.responsiveCGRect(width: 115, height: 16, x: 130, y: 760)
        iconBlocK.frame = UtilsFunc.responsiveCGRect(width: 48, height: 48, x: 163.5, y: 96)
        iconView!.frame.size = CGSize(width: UtilsFunc.doResponsive(24), height: UtilsFunc.doResponsive(24))
        iconView?.center = CGPoint(x: iconBlocK.bounds.midX, y: iconBlocK.bounds.midY)
        buttonSignIn.frame = UtilsFunc.responsiveCGRect(width: 343, height: 56, x: 16, y: 523)
        buttonText.frame = UtilsFunc.responsiveCGRect(width: 60, height: 24, x: 127, y: 16)
        buttonIcon!.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 192, y: 16)
        socialMediaSignIn0.frame = UtilsFunc.responsiveCGRect(width: 56, height: 56, x: 95.5, y: 619)
        socialMediaSignIn1.frame = UtilsFunc.responsiveCGRect(width: 56, height: 56, x: 159.5, y: 619)
        socialMediaSignIn2.frame = UtilsFunc.responsiveCGRect(width: 56, height: 56, x: 223.5, y: 619)
        
        iconMedia0?.frame.size = CGSize(width: UtilsFunc.doResponsive(24), height: UtilsFunc.doResponsive(24))
        iconMedia0?.center = CGPoint(x: socialMediaSignIn0.bounds.midX, y: socialMediaSignIn0.bounds.midY)

        iconMedia1?.frame.size = CGSize(width: UtilsFunc.doResponsive(24), height: UtilsFunc.doResponsive(24))
        iconMedia1?.center = CGPoint(x: socialMediaSignIn1.bounds.midX, y: socialMediaSignIn1.bounds.midY)

        iconMedia2?.frame.size = CGSize(width: UtilsFunc.doResponsive(24), height: UtilsFunc.doResponsive(24))
        iconMedia2?.center = CGPoint(x: socialMediaSignIn2.bounds.midX, y: socialMediaSignIn2.bounds.midY)
    }
    
    private func borderSetUp() {
        iconBlocK.layer.cornerRadius = UtilsFunc.doResponsive(20)
        buttonSignIn.layer.cornerRadius = UtilsFunc.doResponsive(20)
        
        socialMediaSignIn0.layer.borderWidth = UtilsFunc.doResponsive(1)
        socialMediaSignIn0.layer.cornerRadius = UtilsFunc.doResponsive(20)
        socialMediaSignIn1.layer.borderWidth = UtilsFunc.doResponsive(1)
        socialMediaSignIn1.layer.cornerRadius = UtilsFunc.doResponsive(20)
        socialMediaSignIn2.layer.borderWidth = UtilsFunc.doResponsive(1)
        socialMediaSignIn2.layer.cornerRadius = UtilsFunc.doResponsive(20)
    }
    
    private func updateFonts() {
        headerText0.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(30), weight: .bold)
        headerText1.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .regular)
        emailHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        passwordHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        acountHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .medium)
        SignInHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .medium)
        forgotPasswordHeader.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .medium)
        buttonText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .semibold)
    }
    
    private func addLayouts() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(headerText0)
        view.addSubview(headerText1)
        view.addSubview(emailHeader)
        view.addSubview(passwordHeader)
        view.addSubview(acountHeader)
        view.addSubview(SignInHeader)
        view.addSubview(forgotPasswordHeader)
        view.addSubview(iconBlocK)
        iconBlocK.addSubview(iconView!)
        view.addSubview(buttonSignIn)
        buttonSignIn.addSubview(buttonText)
        buttonSignIn.addSubview(buttonIcon!)
        
        view.addSubview(socialMediaSignIn0)
        socialMediaSignIn0.addSubview(iconMedia0!)

        view.addSubview(socialMediaSignIn1)
        socialMediaSignIn1.addSubview(iconMedia1!)

        view.addSubview(socialMediaSignIn2)
        socialMediaSignIn2.addSubview(iconMedia2!)
    }
    // MARK: - Add Actions
    
}




