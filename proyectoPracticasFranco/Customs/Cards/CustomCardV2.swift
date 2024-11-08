//
//  CustomCardV2.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 4/11/24.
//

import UIKit

class CustomCardV2: UIView {

    // MARK: - Fields
    private var action: (() -> Void)?
        
    // MARK: - Constants
    private let baseSize = CGSize(width: 346, height: 104)

    // MARK: - UI Components
    private let checkIcon = UIImageView()
    private let percentageIcon = UIImageView()
    private let excersiseImage = UIImageView()
    
    private let barView = UIView()
    private let barViewContent = UIView()
    private let typeView = UIView()

    private let movementText = UILabel()
    private let headerText = UILabel()
    private let percentageText = UILabel()
    private let typeText = UILabel()
    
    private let circle1 = CircleView(color: .black)

    // MARK: - Initializers
    init(position: CGPoint, action: (() -> Void)? = nil) {
        self.action = action
        let fixedFrame = CGRect(origin: position, size: CGSize(width: Utils.doResponsive(baseSize.width), height: Utils.doResponsive(baseSize.height)))
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
        configureBarView()
        configureType()
        // Image
        configureImages()
        // Icons
        configureIcons()
        // Texts
        configureHeaderText()
        configureTextLabels()
        // Add SubViews
        addLayouts()
    }

    // MARK: - Configuration Methods for Subcomponents
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
        checkIcon.contentMode = .scaleAspectFit
        checkIcon.tintColor = .black
        checkIcon.isUserInteractionEnabled = true
        checkIcon.image = UIImage(systemName: "checkmark.circle")

        
        percentageIcon.contentMode = .scaleAspectFit
        percentageIcon.tintColor = .blue
        percentageIcon.isUserInteractionEnabled = true
        percentageIcon.image = UIImage(systemName: "clock.fill")
}

    private func configureHeaderText() {
        headerText.textAlignment = .center
        headerText.textColor = .black
        headerText.text = "Total Body Circuit"
        headerText.adjustsFontSizeToFitWidth = true
        headerText.minimumScaleFactor = 0.5
    }

    private func configureImages() {
        excersiseImage.contentMode = .scaleAspectFit
//        excersiseImage.image = nil
        excersiseImage.tintColor = .blue
    }

    private func configureTextLabels() {
        movementText.textAlignment = .center
        movementText.textColor = .black
        movementText.text = "Movement 4"

        percentageText.textAlignment = .center
        percentageText.textColor = .black
        percentageText.text = "84%"

        typeText.textAlignment = .center
        typeText.textColor = .black
        typeText.text = "Yoga"
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Self SetUp
        self.frame.size = CGSize(width: Utils.doResponsive(baseSize.width), height: Utils.doResponsive(baseSize.height))
        self.layer.cornerRadius = Utils.doResponsive(32)
        
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }

    private func updateFonts() {
        headerText.font = UIFont.systemFont(ofSize: Utils.responsiveText(16), weight: .black)
        movementText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        percentageText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
        typeText.font = UIFont.systemFont(ofSize: Utils.responsiveText(11), weight: .bold)
    }
    
    private func borderSetUp() {
        excersiseImage.layer.cornerRadius = Utils.doResponsive(20)
        typeView.layer.cornerRadius = Utils.doResponsive(12)
        barView.layer.cornerRadius = Utils.doResponsive(4.5)
        barViewContent.layer.cornerRadius = Utils.doResponsive(4.5)
    }

    private func frameSetUp() {
        // Block
        excersiseImage.frame = Utils.responsiveCGRect(width: 79, height: 82, x: 11, y: 13)
        typeView.frame = Utils.responsiveCGRect(width: 46, height: 27, x: 236, y: 13)
        barView.frame = Utils.responsiveCGRect(width: 227, height: 9, x: 105, y: 50)
        barViewContent.frame = Utils.responsiveCGRect(width: 180, height: 9, x: 105, y: 50)

        // Icons
        checkIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 105, y: 75)
        percentageIcon.frame = Utils.responsiveCGRect(width: 15, height: 15, x: 220, y: 75)
        
        circle1.frame = Utils.responsiveCGRect(width: 5, height: 5, x: 204, y: 79)

        // Texts
        headerText.frame = Utils.responsiveCGRect(width: 121, height: 20, x: 105, y: 17)
        movementText.frame = Utils.responsiveCGRect(width: 77, height: 13, x: 120, y: 75)
        percentageText.frame = Utils.responsiveCGRect(width: 31, height: 13, x: 238, y: 75)
        typeText.frame.size = CGSize(width: Utils.doResponsive(28), height: Utils.doResponsive(13))
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
        
        // Icons
        self.addSubview(checkIcon)
        self.addSubview(percentageIcon)

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

