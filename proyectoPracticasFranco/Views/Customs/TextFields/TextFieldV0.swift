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
    var icon: String?
    
    // MARK: - UI Components
    private let iconContainerView = UIView()
    private var iconView: UIImageView?

    // MARK: - Initializers
    init() {
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
        
        layer.borderColor = UIColor(hex: "F97316")?.cgColor
        
        layer.shadowColor = UIColor(hex: "F97316")?.cgColor  // Color de la sombra
        layer.shadowOpacity = 0.4 // Opacidad de la sombra (ajustar para intensidad)
        layer.shadowOffset = CGSize(width: 0, height: 0)  // Desplazamiento de la sombra (horizontal, vertical)
        
        self.layer.borderWidth = 0
        self.layer.shadowRadius = 0
        
        textColor = .label
        tintColor = .label
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = UIColor(hex: "F3F3F4")
        autocorrectionType = .no
        placeholder = "Ingresa tu Correo"
        setupIcon()

    }
    
    // MARK: - Configuration Methods for Subcomponents
    private func setupIcon() {
        
        iconView = UIImageView.createIcon(systemName: icon ?? "envelope", tintColor: .black, contentMode: .center)
        
        iconView!.center = iconContainerView.center
        iconContainerView.addSubview(iconView!)

        leftView = iconContainerView
        leftViewMode = .always
    }
    
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
        
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()
    }
    
    private func frameSetUp(){
        iconContainerView.frame.size = CGSize(width: UtilsFunc.doResponsive(40 + 24), height: UtilsFunc.doResponsive(24))
        iconView!.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 17, y: 0)
    }

    private func borderSetUp(){
        layer.cornerRadius = UtilsFunc.doResponsive(20)
    }
    
    // MARK: - Add Actions
    private func setUpActions() {
        accionEditing = {
            self.layer.borderWidth = UtilsFunc.doResponsive(2)
            self.layer.shadowRadius = UtilsFunc.doResponsive(10)
        }
        accionEndEditing = {
            self.layer.borderWidth = 0
            self.layer.shadowRadius = 0
        }
    }
    
}


