//
//  SideIconCustom.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 27/11/24.
//

import UIKit

class SideIconCustom: UIView {
    private var iconView: UIImageView?
    
    init(iconView: UIImageView? = nil) {
        self.iconView = iconView
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size = CGSize(width: UtilsFunc.doResponsive(50 + 24), height: UtilsFunc.doResponsive(24))
        iconView!.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 17, y: 0)
    }
    
    private func setUp() {
        iconView!.center = self.center
        self.addSubview(iconView!)
    }
}
