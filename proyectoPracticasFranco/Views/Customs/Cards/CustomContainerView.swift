//
//  CustomContainerView.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 3/11/24.
//

import UIKit

class CustomContainerView: UIView {

    private var action: (() -> Void)?

    // MARK: - Subviews

    private let backgroundImageView = UIImageView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let loadingIndicator = UIActivityIndicatorView(style: .large)

    // Tamaño fijo del contenedor
    private let size = CGSize(width: 200, height: 200)

    // Texto predeterminado
    private let defaultText = "Cargando..."

    // MARK: - Inicialización
    
    init(position: CGPoint, action: (() -> Void)? = nil) {
        // Fijamos el tamaño y permitimos que la posición x e y se defina desde el controlador
        let fixedFrame = CGRect(origin: position, size: CGSize(width: UtilsFunc.doResponsive(size.width), height: UtilsFunc.doResponsive(size.height)))
        super.init(frame: fixedFrame)
        self.action = action
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Configuración de la Vista

    private func setupView() {
        self.backgroundColor = .systemPink
        self.layer.cornerRadius = UtilsFunc.doResponsive(20)
        
        // Configuración de la imagen de fondo
        backgroundImageView.frame = UtilsFunc.responsiveCGRect(width: size.width, height: size.height, x: 0, y: 0)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 12
        backgroundImageView.layer.masksToBounds = true
        addSubview(backgroundImageView)
        
        // Configuración del ícono
        iconImageView.frame = UtilsFunc.responsiveCGRect(width: 30, height: 30, x: 10, y: 10) // Posición y tamaño fijos
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        iconImageView.isUserInteractionEnabled = true // Necesario para detectar gestos
        addSubview(iconImageView)
        
        // Añadir un gesto al ícono
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        iconImageView.addGestureRecognizer(tapGesture)
        
        // Configuración del texto
        titleLabel.frame = UtilsFunc.responsiveCGRect(width: size.width, height: 20, x: 0, y: (size.height / 2) - 10)
        // Centrado horizontalmente
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.text = defaultText // Texto predeterminado
        addSubview(titleLabel)
        
        // Configuración del indicador de carga
        loadingIndicator.center = CGPoint(x: UtilsFunc.doResponsive(size.width / 2), y: UtilsFunc.doResponsive(size.height / 2))
        loadingIndicator.hidesWhenStopped = true
        addSubview(loadingIndicator)
    }
    
    // MARK: - Acción para el ícono
    
    @objc private func iconTapped() {
        action?()
    }
    
    // MARK: - Método de Configuración Pública
    
    func configure(text: String?, icon: UIImage?, backgroundImage: UIImage? = nil) {
        titleLabel.text = text ?? defaultText
        iconImageView.image = icon
        backgroundImageView.image = backgroundImage
        loadingIndicator.stopAnimating() // Ocultar el indicador de carga cuando se haya configurado
    }
    
    // Método para mostrar el indicador de carga
    func showLoading() {
        loadingIndicator.startAnimating()
    }
}
