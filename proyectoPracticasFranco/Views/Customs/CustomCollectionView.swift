import UIKit

enum ScrollType {
    case vertical
    case horizontal
}

class CusomCollectionView <T : Codable, CardType : CustomCardView>: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let layout = UICollectionViewFlowLayout()
    private let endpoint: Endpoint
    private var cards: [T] = []
    private var baseSize: CGSize?
    private let scrollType: ScrollType
    
    init(endpoint: Endpoint, scrollType: ScrollType = .horizontal){
        self.endpoint = endpoint
        self.scrollType = scrollType
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        
        // Configurar layout de la colección
        layout.scrollDirection = (self.scrollType == .horizontal) ? .horizontal : .vertical
        
        
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = true
        self.register(CustomCardCell<CardType>.self, forCellWithReuseIdentifier: "CustomCardCell")
        loadData(endpoint: endpoint)
    }
    
    func loadData(endpoint: Endpoint) {
        UtilsFunc.fetchCardData(endPoint: endpoint)
        {
            (result: Result<[T], NetworkError>) in
            switch result {
            case .success(let cardData):
                // Actualizar UI con los datos
                DispatchQueue.main.async {
                    self.cards = cardData
                    self.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCardCell", for: indexPath) as!
        CustomCardCell<CardType>
        let card = cards[indexPath.row]
        cell.updateCard(with: card as T)
        return cell
    }

    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Obtener el ancho de la pantalla y ajustarlo con márgenes
        return CGSize(width: UtilsFunc.doResponsive(CardType.baseSize.width), height: UtilsFunc.doResponsive(CardType.baseSize.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = CGSize(width: UtilsFunc.doResponsive(CardType.baseSize.width), height: UtilsFunc.doResponsive(CardType.baseSize.height))
        layout.minimumLineSpacing = UtilsFunc.doResponsive(16) // Espacio entre las tarjetas

        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UtilsFunc.doResponsive(58))

    }

}


class CustomCardCell<CardView: CustomCardView>: UICollectionViewCell {
    
    // MARK: - Fields
    var customCardView: CardView
    
    override init(frame: CGRect) {
        customCardView = CardView()
        super.init(frame: frame)
        
        // Add CustomCardV0 as a subview
        self.contentView.addSubview(customCardView)
        customCardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented" )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customCardView.frame = self.bounds
        
//        UtilsFunc.responsiveCGRect(width: self.frame.width, height: self.frame.height, x: 0, y: 0)
    }
    
    // You can create a method to update the card data if needed.
    func updateCard<T : Codable>(with cardData: T) {
        customCardView.updateCardView(with: cardData)
    }
}
