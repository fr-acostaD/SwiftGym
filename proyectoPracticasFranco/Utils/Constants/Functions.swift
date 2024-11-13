//
//  ResponsiveUtil.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 3/11/24.
//


import UIKit

// En lugar de crear una estructura o clase solo para definir métodos estáticos, uso Enum sin casos ya que:
//  - Evita la creación de instancias (el compilador no permite instanciar enums sin casos).
//  - Permite definir funciones estáticas relacionadas sin que haya datos de instancia.

enum UtilsFunc {
    
    static  func doResponsive(_ size: Double) -> Double {
        let screenWidth = UIScreen.main.bounds.width
        return (size * screenWidth) / Constants.sizeWidth
    }

    static  func responsiveText(_ size: Double) -> Double {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth / Constants.sizeWidth) * size
    }

    static  func responsiveCGRect(width: Double, height: Double, x: Double, y: Double, _ ratioType: Bool = true) -> CGRect {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let widthRatio = screenWidth / Constants.sizeWidth
        let heightRatio = screenHeight / Constants.sizeHeight // Cambia 874 si es diferente en tu diseño original
        let ratio = (ratioType ? widthRatio : heightRatio)
        
        return CGRect(x: x * ratio, y: y * ratio, width: width * ratio, height: height * ratio)
    }
    
    static  func fetchCardData<T: Codable>(endPoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        // Esto puede dar fallo por nulabilidad hay que mirarlo bien
        NetworkManager.shared.get(url: endPoint.request!, completion: completion)
    }

    static  func loadImage(from url: URL) -> Data?{
        var imageFromData: Data?
        let request = URLRequest(url: url)

        NetworkManager.shared.get(url: request) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    imageFromData = imageData
                }
            case .failure(_):
                imageFromData = nil
            }
        }
        return imageFromData
    }

}
