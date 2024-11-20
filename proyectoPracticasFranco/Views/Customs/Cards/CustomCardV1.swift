//
//  CustomCardV1.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 4/11/24.
//

import UIKit

class CustomCardV1: UIView, CustomCardView {
    
    // MARK: - Fields

    
    // MARK: - Constants
    static var baseSize = CGSize(width: 264, height: 234)

    // MARK: - UI Components
    private let backgroundImage = UIImageView()
    
    private var fireIcon: UIImageView?
    private var timeIcon: UIImageView?
    private var arrowIcon: UIImageView?
    
    private let typeView = UIView()
    private let continueView = UIView()
    
    private let timeText = UILabel()
    private let headerText = UILabel()
    private let calTexts = UILabel()
    private let typeText = UILabel()
    
    private let circle1 = CircleView(color: .black)
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
        self.backgroundColor = .lightGray

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
        loadingIndicator.startAnimating()
    }
    
    private func configureContinueView() {
        continueView.backgroundColor = .white
    }
    
    private func configureLevelType() {
        typeView.backgroundColor = .gray
    }

    private func configureIcons() {
        
        arrowIcon = UIImageView.createIcon(systemName: "arrow.right", tintColor: .black, contentMode: .scaleAspectFit)
        timeIcon = UIImageView.createIcon(systemName: "clock.fill", tintColor: .blue, contentMode: .scaleAspectFit)
        fireIcon = UIImageView.createIcon(systemName: "flame.fill", tintColor: .systemOrange, contentMode: .scaleAspectFit)
    }

    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .black
    }

    private func configureTextLabels() {
        timeText.textAlignment = .center
        timeText.textColor = .black

        calTexts.textAlignment = .center
        calTexts.textColor = .black

        typeText.textAlignment = .center
        typeText.textColor = .white
    }
    
    func fetchData(endPoint: Endpoint, index at: Int = 0)
    {
        
        UtilsFunc.fetchCardData(endPoint: endPoint)
        {
            (result: Result<[CardV1], NetworkError>) in
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
        guard let cardData = cardData as? CardV1 else {return}
        
        // Actualizar textos
        headerText.text = cardData.header ?? "Default Header"
        timeText.text = cardData.mint ?? "0min"
        calTexts.text = cardData.cal ?? "0 Kcal"
        typeText.text = cardData.type ?? "Type"

        // Cargar imagen de fondo
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
        self.frame.size = CGSize(width: UtilsFunc.doResponsive(CustomCardV1.baseSize.width), height: UtilsFunc.doResponsive(CustomCardV1.baseSize.height))
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
        headerText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .black)
        timeText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        calTexts.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(10), weight: .bold)
    }
    
    private func borderSetUp() {
        continueView.layer.cornerRadius = UtilsFunc.doResponsive(15)
        typeView.layer.cornerRadius = UtilsFunc.doResponsive(7)
    }

    private func frameSetUp() {
        // Block
        continueView.frame = UtilsFunc.responsiveCGRect(width: 50, height: 49, x: 195, y: 172)
        typeView.frame = UtilsFunc.responsiveCGRect(width: 80, height: 25, x: 16, y: 18)
        loadingIndicator.center = CGPoint(x: UtilsFunc.doResponsive(self.bounds.midX),
                                          y: UtilsFunc.doResponsive(self.bounds.midY))
        // Icons
        arrowIcon?.frame = UtilsFunc.responsiveCGRect(width: 24, height: 24, x: 15, y: 15)
        fireIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 93, y: 200)
        fireIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 95, y: 200)
        timeIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 16, y: 200)
        
        circle1.frame = UtilsFunc.responsiveCGRect(width: 5, height: 5, x: 80, y: 205)

        // Texts
        headerText.frame = UtilsFunc.responsiveCGRect(width: 173, height: 18, x: 7, y: 175)
        timeText.frame = UtilsFunc.responsiveCGRect(width: 40, height: 13, x: 35, y: 201)
        calTexts.frame = UtilsFunc.responsiveCGRect(width: 50, height: 13, x: 112, y: 201)
        typeText.frame.size = CGSize(width: UtilsFunc.doResponsive(70), height: UtilsFunc.doResponsive(15))
        typeText.center = CGPoint(x: typeView.bounds.midX, y: typeView.bounds.midY)
}

    private func addLayouts()
    {
        self.addSubview(backgroundImage)
        self.addSubview(loadingIndicator)
        
        // ContinueView
        self.addSubview(continueView)
        continueView.addSubview(arrowIcon!)
        
        // LevelType
        self.addSubview(typeView)
        typeView.addSubview(typeText)
        
        // Icons

        self.addSubview(timeIcon!)
        self.addSubview(fireIcon!)

        self.addSubview(circle1)

        // Texts
        self.addSubview(timeText)
        self.addSubview(calTexts)
        self.addSubview(headerText)
    }
    // MARK: - Add Actions
    // go
}
