import UIKit

class HorizontalCardViewController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let layout = UICollectionViewFlowLayout()

    
    init(){
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        // Configurar layout de la colección
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: 264, height: 234) // Tamaño de las tarjetas
        

        self.backgroundColor = .clear
        self.isPagingEnabled = true   // Para auto posicionarse
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self

        // Registrar celda reutilizable
        self.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCardV1")
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Número de tarjetas
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCardV1", for: indexPath) as! CardCollectionViewCell
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Obtener el ancho de la pantalla y ajustarlo con márgenes
          
        return CGSize(width: UtilsFunc.doResponsive(CustomCardV1.baseSize.width), height: UtilsFunc.doResponsive(CustomCardV1.baseSize.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout.minimumLineSpacing = UtilsFunc.doResponsive(16) // Espacio entre las tarjetas
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UtilsFunc.doResponsive(16))
        
        
        // Ajustar el contentSize para asegurar que hay espacio suficiente
        let widthCard = CustomCardV1.baseSize.width
        self.contentSize = CGSize(width: UtilsFunc.doResponsive(7 * ((widthCard * 1.5075) + 16) ), height: self.frame.height)
    }
}

//extension HorizontalCardViewController: UIScrollViewDelegate {
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        // Ancho total de la celda (celda + espaciado)
//        let cellWidthIncludingSpacing = Utils.doResponsive(CustomCardV1.baseSize.width) + Utils.doResponsive(20)
//
//        // Posición objetivo según el desplazamiento actual
//        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
//        
//        // Redondear al índice más cercano basado en la velocidad
//        var targetIndex = round(estimatedIndex)
//        
//        // Ajustar si el usuario se desplaza rápido
//        if velocity.x > 0 {
//            targetIndex = floor(estimatedIndex + 1)
//        } else if velocity.x < 0 {
//            targetIndex = ceil(estimatedIndex - 1)
//        }
//
//        // Calcular el desplazamiento final
//        let targetOffset = targetIndex * cellWidthIncludingSpacing
//        targetContentOffset.pointee = CGPoint(x: targetOffset, y: 0)
//    }
//}



// MARK: - CardCell

class CardCollectionViewCell: UICollectionViewCell {
    private var customCard: CustomCardV1!
    
    // Inicializamos la celda con un frame dado
    override init(frame: CGRect) {
        super.init(frame: frame)
        customCard = CustomCardV1(position: .zero)
        contentView.addSubview(customCard)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hacer que la celda se ajuste al tamaño correcto cuando el layout cambia
    override func layoutSubviews() {
        super.layoutSubviews()
        customCard.frame = UtilsFunc.responsiveCGRect(width: self.frame.width, height: self.frame.height, x: 0, y: 0)    }
}
