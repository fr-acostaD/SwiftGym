//
//  File.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 3/11/24.
//

import UIKit

class CustomCardV0: UIView {

    // MARK: - Fields
    private var action: (() -> Void)?
    private var cardV0: CardV0!

    
    // MARK: - Constants
    private let baseSize = CGSize(width: 343, height: 258)
    
    // MARK: - UI Components
    private let fireIcon = UIImageView()
    private let timeIcon = UIImageView()
    private let dummbleIcon = UIImageView()
    private let likeIcon = UIImageView()
    private let shareIcon = UIImageView()
    private let playIcon = UIImageView()
    
    private let levelType = UIView()
    private let continueView = UIView()
    
    private let timeText = UILabel()
    private let headerText = UILabel()
    private let calTexts = UILabel()
    private let typeText = UILabel()
    private let levelText = UILabel()
    
    private let circle1 = CircleView(color: .lightGray)
    private let circle2 = CircleView(color: .lightGray)


    // MARK: - Initializers
    init(position: CGPoint, cardV0: CardV0 = CardV0() ,action: (() -> Void)? = nil) {
        self.action = action
        self.cardV0 = cardV0
        let fixedFrame = CGRect(origin: position, size: CGSize(width: Utils.doResponsive(baseSize.width), height: Utils.doResponsive(baseSize.height)))
        super.init(frame: fixedFrame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Storyboard is not be able for this View.")
    }

    // MARK: - Setup Methods
    private func setupView() {
        self.backgroundColor = .black
//        self.layer.cornerRadius = 0

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
//        continueView.layer.borderWidth = 0    
        continueView.layer.borderColor = UIColor.red.cgColor
        continueView.backgroundColor = .orange
    }
    
    private func configureLevelType() {
        levelType.backgroundColor = .gray
//        levelType.layer.cornerRadius = 0
    }

    private func configureIcons() {
        playIcon.contentMode = .scaleAspectFit
        playIcon.tintColor = .white
        playIcon.isUserInteractionEnabled = true
        playIcon.image = UIImage(systemName: "play.fill")

        shareIcon.tintColor = .gray
        shareIcon.contentMode = .scaleAspectFit
        shareIcon.isUserInteractionEnabled = true    
        shareIcon.image = UIImage(systemName: "square.and.arrow.up")

        likeIcon.contentMode = .scaleAspectFit
        likeIcon.tintColor = .gray
        likeIcon.isUserInteractionEnabled = true
        likeIcon.image = UIImage(systemName: "heart.fill")
        
        timeIcon.contentMode = .scaleAspectFit
        timeIcon.tintColor = .blue
        timeIcon.isUserInteractionEnabled = true
        timeIcon.image = UIImage(systemName: "clock.fill")
        
        fireIcon.contentMode = .scaleAspectFit
        fireIcon.tintColor = .systemOrange
        fireIcon.isUserInteractionEnabled = true
        fireIcon.image = UIImage(systemName: "flame.fill")
        
        dummbleIcon.contentMode = .scaleAspectFit
        dummbleIcon.tintColor = .blue
        dummbleIcon.isUserInteractionEnabled = true
        dummbleIcon.image = UIImage(systemName: "heart.fill")
}
    
    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .white
//        headerText.font = UIFont.systemFont(ofSize: 0, weight: .bold)    
        headerText.text = cardV0.header ?? "Total Body Circuit"
    }

    private func configureTextLabels() {
        timeText.textAlignment = .center
        timeText.textColor = .lightGray
//        timeText.font = UIFont.systemFont(ofSize: 0, weight: .bold)    
        timeText.text = cardV0.mint ?? "35min"

        calTexts.textAlignment = .center
        calTexts.textColor = .lightGray
//        calTexts.font = UIFont.systemFont(ofSize: 0, weight: .bold)    
        calTexts.text = cardV0.cal ?? "205Kcal"

        typeText.textAlignment = .center
        typeText.textColor = .lightGray
//        typeText.font = UIFont.systemFont(ofSize: 0, weight: .bold)    
        typeText.text = cardV0.type ?? "Upper Body"

        levelText.textAlignment = .center
        levelText.textColor = .white
//        levelText.font = UIFont.systemFont(ofSize: 0, weight: .bold)    
        levelText.text = cardV0.level ?? "Intermediate"  
    }

    private func configureShareAndLikeIcons() {
        shareIcon.contentMode = .scaleAspectFit
        shareIcon.tintColor = .gray
        shareIcon.isUserInteractionEnabled = true
        shareIcon.image = UIImage(systemName: "square.and.arrow.up")

        likeIcon.contentMode = .scaleAspectFit
        likeIcon.tintColor = .gray
        likeIcon.isUserInteractionEnabled = true
        likeIcon.image = UIImage(systemName: "heart.fill")
    }

    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Self SetUp
        self.frame.size = CGSize(width: Utils.doResponsive(baseSize.width), height: Utils.doResponsive(baseSize.height))
        self.layer.cornerRadius = Utils.doResponsive(20)
        
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }

    private func updateFonts() {
        headerText.font = UIFont.systemFont(ofSize: Utils.responsiveText(20), weight: .black)
        timeText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        calTexts.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        levelText.font = UIFont.systemFont(ofSize: Utils.responsiveText(10), weight: .bold)
    }
    
    private func borderSetUp() {
        continueView.layer.cornerRadius = Utils.doResponsive(20)
        continueView.layer.borderWidth = Utils.doResponsive(4)
        levelType.layer.cornerRadius = Utils.doResponsive(7)
    }

    private func frameSetUp(){
        // Block
        continueView.frame = Utils.responsiveCGRect(width: 53, height: 53, x: 277, y: 190)
        levelType.frame = Utils.responsiveCGRect(width: 80, height: 25, x: 16, y: 18)
        
        // Icons
        playIcon.frame = Utils.responsiveCGRect(width: 24, height: 24, x: 15, y: 15)
        shareIcon.frame = Utils.responsiveCGRect(width: 27, height: 27, x: 264, y: 17)
        likeIcon.frame = Utils.responsiveCGRect(width: 27, height: 27, x: 302, y: 17)
        fireIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 93, y: 225)
        timeIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 16, y: 225)
        dummbleIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 178, y: 226)
        
        circle1.frame = Utils.responsiveCGRect(width: 5, height: 5, x: 80, y: 231)
        circle2.frame = Utils.responsiveCGRect(width: 5, height: 5, x: 168, y: 231)
        // Texts
        headerText.frame = Utils.responsiveCGRect(width: 185, height: 20, x: 16, y: 194)
        timeText.frame = Utils.responsiveCGRect(width: 40, height: 15, x: 37, y: 225)
        calTexts.frame = Utils.responsiveCGRect(width: 50, height: 18, x: 113, y: 225)
        typeText.frame = Utils.responsiveCGRect(width: 70, height: 18, x: 195, y: 225)
        levelText.frame.size = CGSize(width: Utils.doResponsive(70), height: Utils.doResponsive(15))
        levelText.center = CGPoint(x: levelType.bounds.midX, y: levelType.bounds.midY)
    }
    
    private func addLayouts()
    {
        // ContinueView
        self.addSubview(continueView)
        continueView.addSubview(playIcon)
        
        // LevelType
        self.addSubview(levelType)
        levelType.addSubview(levelText)
        
        // Icons
        self.addSubview(shareIcon)
        self.addSubview(likeIcon)
        self.addSubview(timeIcon)
        self.addSubview(fireIcon)
        self.addSubview(dummbleIcon)

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

