//
//  CircleView.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 4/11/24.
//

import UIKit

class CircleView: UIView {
    // MARK: Fields
    private var color: UIColor!
    
    // MARK: - Initializers
    init(color: UIColor) {
        self.color = color
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize.zero))
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard is not be able for this View.")
    }
    
    private func setupView() {
        // Establece el color de fondo del círculo
        self.backgroundColor = color // Cambia el color a lo que desees
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Ajusta el corner radius en layoutSubviews para asegurarte de que se mantenga
        self.layer.cornerRadius = Utils.doResponsive(self.bounds.size.width / 2)
    }
}
