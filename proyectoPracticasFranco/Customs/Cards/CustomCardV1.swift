//
//  CustomCardV1.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 4/11/24.
//

import UIKit

class CustomCardV1: UIView {

    // MARK: - Fields
    private var action: (() -> Void)?
    private var cardV1: CardV1!

    
    // MARK: - Constants
    static let baseSize = CGSize(width: 264, height: 234)

    // MARK: - UI Components
    private let fireIcon = UIImageView()
    private let timeIcon = UIImageView()
    private let arrowIcon = UIImageView()
    
    private let typeView = UIView()
    private let continueView = UIView()
    
    private let timeText = UILabel()
    private let headerText = UILabel()
    private let calTexts = UILabel()
    private let typeText = UILabel()
    
    private let circle1 = CircleView(color: .black)

    // MARK: - Initializers
    init(position: CGPoint, cardV1: CardV1 = CardV1(), action: (() -> Void)? = nil) {
        self.action = action
        self.cardV1 = cardV1
        let fixedFrame = CGRect(origin: position, size: CGSize(width: Utils.doResponsive(CustomCardV1.baseSize.width), height: Utils.doResponsive(CustomCardV1.baseSize.height)))
        super.init(frame: fixedFrame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Storyboard is not be able for this View.")
    }

    // MARK: - Setup Methods
    private func setupView() {
        self.backgroundColor = .lightGray

        // Components Configurations
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
    private func configureContinueView() {
        continueView.backgroundColor = .white
    }
    
    private func configureLevelType() {
        typeView.backgroundColor = .gray
    }

    private func configureIcons() {
        arrowIcon.contentMode = .scaleAspectFit
        arrowIcon.tintColor = .black
        arrowIcon.isUserInteractionEnabled = true
        arrowIcon.image = UIImage(systemName: "arrow.right")

        
        timeIcon.contentMode = .scaleAspectFit
        timeIcon.tintColor = .blue
        timeIcon.isUserInteractionEnabled = true
        timeIcon.image = UIImage(systemName: "clock.fill")
        
        fireIcon.contentMode = .scaleAspectFit
        fireIcon.tintColor = .systemOrange
        fireIcon.isUserInteractionEnabled = true
        fireIcon.image = UIImage(systemName: "flame.fill")
}
    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .black
        headerText.text = cardV1.header ?? "Total Body Circuit"
    }

    private func configureTextLabels() {
        timeText.textAlignment = .center
        timeText.textColor = .black
        timeText.text = cardV1.mint ?? "35min"

        calTexts.textAlignment = .center
        calTexts.textColor = .black
        calTexts.text = cardV1.cal ?? "205Kcal"

        typeText.textAlignment = .center
        typeText.textColor = .white
        typeText.text = cardV1.type ?? "Upper Body"
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Self SetUp
        self.frame.size = CGSize(width: Utils.doResponsive(CustomCardV1.baseSize.width), height: Utils.doResponsive(CustomCardV1.baseSize.height))
        self.layer.cornerRadius = Utils.doResponsive(20)
        
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }

    private func updateFonts() {
        headerText.font = UIFont.systemFont(ofSize: Utils.responsiveText(16), weight: .black)
        timeText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        calTexts.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: Utils.responsiveText(10), weight: .bold)
    }
    
    private func borderSetUp() {
        continueView.layer.cornerRadius = Utils.doResponsive(20)
        typeView.layer.cornerRadius = Utils.doResponsive(7)
    }

    private func frameSetUp() {
        // Block
        continueView.frame = Utils.responsiveCGRect(width: 50, height: 49, x: 195, y: 172)
        typeView.frame = Utils.responsiveCGRect(width: 80, height: 25, x: 16, y: 18)
        
        // Icons
        arrowIcon.frame = Utils.responsiveCGRect(width: 24, height: 24, x: 15, y: 15)
        fireIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 93, y: 200)
        fireIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 95, y: 200)
        timeIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 16, y: 200)
        
        circle1.frame = Utils.responsiveCGRect(width: 5, height: 5, x: 80, y: 205)

        // Texts
        headerText.frame = Utils.responsiveCGRect(width: 173, height: 18, x: 7, y: 175)
        timeText.frame = Utils.responsiveCGRect(width: 40, height: 13, x: 35, y: 201)
        calTexts.frame = Utils.responsiveCGRect(width: 50, height: 13, x: 112, y: 201)
        typeText.frame.size = CGSize(width: Utils.doResponsive(70), height: Utils.doResponsive(15))
        typeText.center = CGPoint(x: typeView.bounds.midX, y: typeView.bounds.midY)
}

    private func addLayouts()
    {
        // ContinueView
        self.addSubview(continueView)
        continueView.addSubview(arrowIcon)
        
        // LevelType
        self.addSubview(typeView)
        typeView.addSubview(typeText)
        
        // Icons

        self.addSubview(timeIcon)
        self.addSubview(fireIcon)

        self.addSubview(circle1)

        // Texts
        self.addSubview(timeText)
        self.addSubview(calTexts)
        self.addSubview(headerText)
    }
    // MARK: - Add Actions
    // go
}
