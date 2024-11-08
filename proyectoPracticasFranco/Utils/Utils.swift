//
//  ResponsiveUtil.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 3/11/24.
//


import UIKit

enum Utils {
    
    static  func doResponsive(_ size: Double) -> Double {
        let screenWidth = UIScreen.main.bounds.width
        return (size * screenWidth) / 376
    }
    static  func responsiveText(_ size: Double) -> Double {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth / 376) * size
    }
    
    static  func responsiveCGRect(width: Double, height: Double, x: Double, y: Double, _ ratioType: Bool = true) -> CGRect {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let widthRatio = screenWidth / 376
        let heightRatio = screenHeight / 874 // Cambia 874 si es diferente en tu diseño original
        let ratio = (ratioType ? widthRatio : heightRatio)
        
        return CGRect(x: x * ratio, y: y * ratio, width: width * ratio, height: height * ratio)
    }
    
    // Otras utilidades responsivas pueden ir aquí
}
