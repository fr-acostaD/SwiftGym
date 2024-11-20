//
//  File.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 3/11/24.
//

import UIKit

class CustomCardV0: UIView, CustomCardView {

    // MARK: - Fields
    
    // MARK: - Constants
    static var baseSize = CGSize(width: 343, height: 258)
    
    // MARK: - UI Components
    private let backgroundImage = UIImageView()

    private var fireIcon: UIImageView?
    private var timeIcon: UIImageView?
    private var dummbleIcon: UIImageView?
    private var likeIcon: UIImageView?
    private var shareIcon: UIImageView?
    private var playIcon: UIImageView?
    
    private let levelType = UIView()
    private let continueView = UIView()
    
    private let timeText = UILabel()
    private let headerText = UILabel()
    private let calTexts = UILabel()
    private let typeText = UILabel()
    private let levelText = UILabel()
    
    private let circle1 = CircleView(color: .lightGray)
    private let circle2 = CircleView(color: .lightGray)
    private let loadingIndicator = UIActivityIndicatorView(style: .large)


    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Storyboard is not be able for this View.")
    }

    // MARK: - Setup Methods
    private func setupView() {
        self.backgroundColor = .black

        // Components Configurations
        configureBackgroundImage()
        configureContinueView()
        configureLevelType()
        // Icons
        configureIcons()
        // Texts
        configureHeaderText()
        configureTextLabels()
        
        // Add SubViews
        addLayouts()
    }

    // MARK: - Configuration Methods for Subcomponents
    
    private func configureBackgroundImage() {
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.clipsToBounds = true
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIndicator.color = .orange
        loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.startAnimating()
    }
    
    private func configureContinueView() {
        continueView.layer.borderColor = UIColor.red.cgColor
        continueView.backgroundColor = .orange
    }
    
    private func configureLevelType() {
        levelType.backgroundColor = .gray
    }

    private func configureIcons() {
            // Inicializar los iconos aquí
            fireIcon = UIImageView.createIcon(systemName: "flame.fill", tintColor: .systemOrange, contentMode: .scaleAspectFit)
            timeIcon = UIImageView.createIcon(systemName: "clock.fill", tintColor: .blue, contentMode: .scaleAspectFit)
            dummbleIcon = UIImageView.createIcon(systemName: "heart.fill", tintColor: .blue, contentMode: .scaleAspectFit)
            likeIcon = UIImageView.createIcon(systemName: "heart.fill", tintColor: .gray, contentMode: .scaleAspectFit)
            shareIcon = UIImageView.createIcon(systemName: "square.and.arrow.up", tintColor: .gray, contentMode: .scaleAspectFit)
            playIcon = UIImageView.createIcon(systemName: "play.fill", tintColor: .white, contentMode: .scaleAspectFit)
}
        
    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .white
    }

    private func configureTextLabels() {
        timeText.textAlignment = .center
        timeText.textColor = .lightGray

        calTexts.textAlignment = .center
        calTexts.textColor = .lightGray

        typeText.textAlignment = .center
        typeText.textColor = .lightGray


        levelText.textAlignment = .center
        levelText.textColor = .white

    }
    
    func fetchData(endPoint: Endpoint, index at: Int = 0)
    {
        
        UtilsFunc.fetchCardData(endPoint: endPoint)
        {
            (result: Result<[CardV0], NetworkError>) in
            switch result {
            case .success(let cardData):
                // Actualizar UI con los datos
                DispatchQueue.main.async {
                    self.updateCardView(with: cardData[at])
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    public func updateCardView(with cardData: Codable) {
        guard let cardData = cardData as? CardV0 else {return}

        // Actualizar textos
        typeText.text = cardData.type ?? "Upper Body"
        calTexts.text = cardData.cal ?? "205Kcal"
        timeText.text = cardData.mint ?? "35min"
        levelText.text = cardData.level ?? "Intermediate"
        headerText.text = cardData.header ?? "Total Body Circuit"
        
        if let imageUrlString = cardData.imageURL, let url = URL(string: imageUrlString) {
            
            UtilsFunc.loadImage(from: url) { image in
                self.backgroundImage.image = image

                self.loadingIndicator.stopAnimating()
            }
        }
    }

    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Self SetUp
        self.frame.size = CGSize(width: UtilsFunc.doResponsive(CustomCardV0.baseSize.width), height: UtilsFunc.doResponsive(CustomCardV0.baseSize.height))
        self.layer.cornerRadius = UtilsFunc.doResponsive(20)
        backgroundImage.frame = self.bounds
        backgroundImage.layer.cornerRadius = self.layer.cornerRadius

        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }

    private func updateFonts() {

        headerText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(20), weight: .black)
        timeText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        calTexts.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        levelText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(10), weight: .bold)
    }
    
    private func borderSetUp() {
        continueView.layer.cornerRadius = UtilsFunc.doResponsive(20)
        continueView.layer.borderWidth = UtilsFunc.doResponsive(4)
        levelType.layer.cornerRadius = UtilsFunc.doResponsive(7)
    }

    private func frameSetUp(){
        // Block
        continueView.frame = UtilsFunc.responsiveCGRect(width: 53, height: 53, x: 277, y: 190)
        levelType.frame = UtilsFunc.responsiveCGRect(width: 80, height: 25, x: 16, y: 18)
        loadingIndicator.center = CGPoint(x: UtilsFunc.doResponsive(self.bounds.midX),
                                          y: UtilsFunc.doResponsive(self.bounds.midY))

        // Icons
        playIcon?.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 15, y: 15)
        shareIcon?.frame = UtilsFunc.responsiveCGRect(width: 27, height: 27, x: 264, y: 17)
        likeIcon?.frame = UtilsFunc.responsiveCGRect(width: 27, height: 27, x: 302, y: 17)
        fireIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 93, y: 225)
        timeIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 16, y: 225)
        dummbleIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 178, y: 226)
        
        circle1.frame = UtilsFunc.responsiveCGRect(width: 5, height: 5, x: 80, y: 231)
        circle2.frame = UtilsFunc.responsiveCGRect(width: 5, height: 5, x: 168, y: 231)
        // Texts
        headerText.frame = UtilsFunc.responsiveCGRect(width: 185, height: 20, x: 16, y: 194)
        timeText.frame = UtilsFunc.responsiveCGRect(width: 40, height: 15, x: 37, y: 225)
        calTexts.frame = UtilsFunc.responsiveCGRect(width: 50, height: 18, x: 113, y: 225)
        typeText.frame = UtilsFunc.responsiveCGRect(width: 70, height: 18, x: 195, y: 225)
        levelText.frame.size = CGSize(width: UtilsFunc.doResponsive(70), height: UtilsFunc.doResponsive(15))
        levelText.center = CGPoint(x: levelType.bounds.midX, y: levelType.bounds.midY)
    }
    
    private func addLayouts()
    {
        self.addSubview(backgroundImage)
        self.addSubview(loadingIndicator)

        
        // ContinueView
        self.addSubview(continueView)
        continueView.addSubview(playIcon!)
        
        // LevelType
        self.addSubview(levelType)
        levelType.addSubview(levelText)
        
        // Icons
        self.addSubview(shareIcon!)
        self.addSubview(likeIcon!)
        self.addSubview(timeIcon!)
        self.addSubview(fireIcon!)
        self.addSubview(dummbleIcon!)

        self.addSubview(circle1)
        self.addSubview(circle2)

        // Texts
        self.addSubview(typeText)
        self.addSubview(timeText)
        self.addSubview(calTexts)
        self.addSubview(headerText)

    }
    
    // MARK: - Add Actions
    
    // share
    // liked
    // continue
}

extension UIImageView {
    static func createIcon(systemName: String, tintColor: UIColor = .gray, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        let iconView = UIImageView()
        iconView.image = UIImage(systemName: systemName)
        iconView.tintColor = tintColor
        iconView.contentMode = contentMode
        iconView.isUserInteractionEnabled = true
        return iconView
    }
}
