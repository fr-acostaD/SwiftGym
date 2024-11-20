//
//  CustomCardV2.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 4/11/24.
//

import UIKit

class CustomCardV2: UIView, CustomCardView {


    // MARK: - Fields
    private var processValue: Double?
    
    // MARK: - Constants
    static var baseSize = CGSize(width: 346, height: 104)
    
    // MARK: - UI Components
    private var checkIcon: UIImageView?
    private var percentageIcon: UIImageView?
    
    private let excersiseImage = UIImageView()
    
    private let barView = UIView()
    private let barViewContent = UIView()
    private let typeView = UIView()

    private let movementText = UILabel()
    private let headerText = UILabel()
    private let percentageText = UILabel()
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
        configureBarView()
        configureType()
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
        excersiseImage.contentMode = .scaleToFill
        excersiseImage.clipsToBounds = true
        excersiseImage.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIndicator.color = .orange
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
    }
    
    private func configureBarView() {
        barView.backgroundColor = .gray
        barView.clipsToBounds = true

        barViewContent.backgroundColor = .black
        barViewContent.clipsToBounds = true
    }
    
    private func configureType() {
        typeView.backgroundColor = .gray
    }

    private func configureIcons() {
        
        checkIcon = UIImageView.createIcon(systemName: "checkmark.circle", tintColor: .black, contentMode: .scaleAspectFit)
        percentageIcon = UIImageView.createIcon(systemName: "checkmark.circle", tintColor: .blue, contentMode: .scaleAspectFit)
}

    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .black
        headerText.adjustsFontSizeToFitWidth = true
        headerText.minimumScaleFactor = 0.5
    }

    private func configureTextLabels() {
        movementText.textAlignment = .center
        movementText.textColor = .black

        percentageText.textAlignment = .center
        percentageText.textColor = .black

        typeText.textAlignment = .center
        typeText.textColor = .black
    }
    
    func fetchData(endPoint: Endpoint, index at: Int = 0)
    {
        
        UtilsFunc.fetchCardData(endPoint: endPoint)
        {
            (result: Result<[CardV2], NetworkError>) in
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
        guard let cardData = cardData as? CardV2 else {return}
        
        // Actualizar textos
        headerText.text = cardData.header ?? "Total Body Circuit"
        percentageText.text = cardData.percentage ?? "84%"
        processValue = Double(cardData.process ?? "0.8")!
        typeText.text = cardData.type ?? "Yoga"
        movementText.text = cardData.movement ?? "Movement 4"
        // Cargar imagen de fondo
        if let imageUrlString = cardData.imageURL, let url = URL(string: imageUrlString) {
            
            UtilsFunc.loadImage(from: url) { image in
                self.excersiseImage.image = image

                self.loadingIndicator.stopAnimating()
            }
        }
    }
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        // Self SetUp
        self.frame.size = CGSize(width: UtilsFunc.doResponsive(CustomCardV2.baseSize.width), height: UtilsFunc.doResponsive(CustomCardV2.baseSize.height))
        self.layer.cornerRadius = UtilsFunc.doResponsive(20)
        excersiseImage.frame = UtilsFunc.responsiveCGRect(width: 79, height: 82, x: 11, y: 13)
        excersiseImage.layer.cornerRadius = UtilsFunc.doResponsive(20)
        
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }

    private func updateFonts() {
        headerText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .black)
        movementText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        percentageText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(11), weight: .bold)
    }
    
    private func borderSetUp() {
        typeView.layer.cornerRadius = UtilsFunc.doResponsive(12)
        barView.layer.cornerRadius = UtilsFunc.doResponsive(4.5)
        barViewContent.layer.cornerRadius = UtilsFunc.doResponsive(4.5)
    }

    private func frameSetUp() {
        // Block
        typeView.frame = UtilsFunc.responsiveCGRect(width: 46, height: 27, x: 236, y: 13)
        barView.frame = UtilsFunc.responsiveCGRect(width: 227, height: 9, x: 105, y: 50)
        barViewContent.frame = UtilsFunc.responsiveCGRect(width: (self.barView.frame.width * (processValue ?? 0.8)), height: 9, x: 105, y: 50)

        // Icons
        checkIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 105, y: 75)
        percentageIcon?.frame = UtilsFunc.responsiveCGRect(width: 15, height: 15, x: 220, y: 75)
        
        circle1.frame = UtilsFunc.responsiveCGRect(width: 5, height: 5, x: 204, y: 79)

        // Texts
        headerText.frame = UtilsFunc.responsiveCGRect(width: 121, height: 20, x: 105, y: 17)
        movementText.frame = UtilsFunc.responsiveCGRect(width: 77, height: 13, x: 120, y: 75)
        percentageText.frame = UtilsFunc.responsiveCGRect(width: 31, height: 13, x: 238, y: 75)
        typeText.frame.size = CGSize(width: UtilsFunc.doResponsive(28), height: UtilsFunc.doResponsive(13))
        typeText.center = CGPoint(x: typeView.bounds.midX, y: typeView.bounds.midY)
}

    private func addLayouts()
    {


        // TypeView
        self.addSubview(typeView)
        typeView.addSubview(typeText)
        
        // BarView
        self.addSubview(barView)
        self.addSubview(barViewContent)
        
        // Image
        self.addSubview(excersiseImage)
        excersiseImage.addSubview(loadingIndicator)
        
        // Icons
        self.addSubview(checkIcon!)
        self.addSubview(percentageIcon!)

        self.addSubview(circle1)

        // Texts
        self.addSubview(headerText)
        self.addSubview(movementText)
        self.addSubview(percentageText)
    }

    // MARK: - Add Actions
    // go
    // isCompleted
    // barSize
}

