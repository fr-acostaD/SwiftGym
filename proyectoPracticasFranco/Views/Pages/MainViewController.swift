import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Fields
    let urlImage: String = "https://thispersondoesnotexist.com/"
    let userName: String = "Franco"
    // MARK: - UI Components
    // Card
    private var containerViewV0: CustomCardV0!
    // ScrollView
    private var scrollView = UIScrollView()
    // Header Icons
    private let porfilePicture =  UIImageView()
    private let searchIcon =  UIImageView()
    // Texts
    private let greetingsText1 =  UILabel()
    private let greetingsText2 =  UILabel()
    private let titleText1 =  UILabel()
    private let titleText2 =  UILabel()
    private let titleText3 =  UILabel()
    private let titleText4_1 =  UILabel()
    private let titleText4_2 =  UILabel()
    private let titleText4_3 =  UILabel()
    // Carrusels Collections
    private let cardListView1 = CusomCollectionView<CardV1, CustomCardV1>(endpoint:  EndPoints.endpointCardV1)
    private let cardListView2 = CusomCollectionView<CardV2, CustomCardV2>(endpoint:  EndPoints.endpointCardV2, scrollType: .vertical)
    // Buttons
    private let searchButtonView =  UIView()
    
    // MARK: - Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("StoryBoard is not be able in this Controller")
    }
    
    
    override func loadView() {
        super.loadView()
        setupUI()
        setupActions()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayOut()
    }

    // MARK: - Setup Methods
    
    private func setupUI() {
        // Self Color Background
        view.backgroundColor = .white
        cardListView1.translatesAutoresizingMaskIntoConstraints = false
        cardListView2.translatesAutoresizingMaskIntoConstraints = false

        // Components Configurations
        configureScrollView()
        
        // Cards Configurations
        configureCustomsCards()
        configureTextLabels()
        
        // Icons
        configureIcons()

        // Add Subviews
        addLayouts()
    }
    
    // MARK: - Configuration Methods for Subcomponents
    private func configureScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCustomsCards() {
        containerViewV0 = CustomCardV0()
        containerViewV0.fetchData(endPoint: EndPoints.endpointCardV0)
    }
    
    private func configureSearchButtom() {
        searchButtonView.layer.borderColor = UIColor.black.cgColor
        searchButtonView.backgroundColor = .white
    }
    
    private func configureTextLabels() {
        titleText1.textAlignment = .center
        titleText1.textColor = .black
        titleText1.text = "Featured"

        titleText2.textAlignment = .center
        titleText2.textColor = .black
        titleText2.text = "Recomended"
        
        titleText3.textAlignment = .center
        titleText3.textColor = .black
        titleText3.text = "My Workout"
        
        textTitle4Config(titleText4: titleText4_1)
        textTitle4Config(titleText4: titleText4_2)
        textTitle4Config(titleText4: titleText4_3)

        greetingsText1.textAlignment = .center
        greetingsText1.textColor = .black
        greetingsText1.text = "Ready for Training"
        
        greetingsText2.textAlignment = .center
        greetingsText2.textColor = .black
        greetingsText2.text = "Hello, \(userName)!"
    }

    private func textTitle4Config(titleText4: UILabel) -> Void{
        titleText4.textAlignment = .center
        titleText4.textColor = .systemOrange
        titleText4.text = "See All"
    }

    private func configureIcons() {
        porfilePicture.contentMode = .scaleAspectFit
        porfilePicture.tintColor = .blue
        porfilePicture.isUserInteractionEnabled = true
        porfilePicture.image = UIImage(systemName: "person.circle.fill")
        porfilePicture.clipsToBounds = true
        UtilsFunc.loadImage(from: URL(string: urlImage)!) { image in
            self.porfilePicture.image = image
        }
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.tintColor = .gray
        searchIcon.isUserInteractionEnabled = true
        searchIcon.image = UIImage(systemName: "magnifyingglass")
    }

    // MARK: - Layout
    private func setUpLayOut() {
        // Frames
        frameSetUp()

        // Borders
        borderSetUp()

        // Font Sizes
        updateFonts()
    }
    
    private func frameSetUp() {
        
        let safeArea = view.safeAreaInsets

        // ScrollView Responsive
        scrollView.frame = UtilsFunc.responsiveCGRect(
            width: view.bounds.width,
            height: view.bounds.height - safeArea.top - safeArea.bottom, // Super importante esto
            x: 0,
            y: safeArea.top
        )
        scrollView.contentSize = CGSize(width: UtilsFunc.doResponsive(view.bounds.width), height: UtilsFunc.doResponsive(1338))
        
        // Cards Responsives
        containerViewV0.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(225))
        cardListView1.frame = UtilsFunc.responsiveCGRect(width: UIScreen.main.bounds.width, height: 300, x: 16, y: 545)
        
        cardListView2.frame = UtilsFunc.responsiveCGRect(width: UIScreen.main.bounds.width, height: 404, x: 16, y: 900)

        // Icons
        porfilePicture.frame = UtilsFunc.responsiveCGRect(width: 57, height: 57, x: 18, y: 59)
        searchButtonView.frame = UtilsFunc.responsiveCGRect(width: 57, height: 57, x: 302, y: 59)
        searchIcon.frame.size = CGSize(width: UtilsFunc.doResponsive(70), height: UtilsFunc.doResponsive(15))
        searchIcon.center = CGPoint(x: searchButtonView.bounds.midX, y: searchButtonView.bounds.midY)
        
        // Texts
        greetingsText1.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 80, y: 62)
        greetingsText2.frame = UtilsFunc.responsiveCGRect(width: 135, height: 18, x: 85, y: 87)
        
        titleText1.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 182)
        titleText2.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 527)
        titleText3.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 857)
        titleText4_1.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 182)
        titleText4_2.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 527)
        titleText4_3.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 857)
    }
    
    private func borderSetUp() {
        searchButtonView.layer.borderWidth = UtilsFunc.doResponsive(1)
        searchButtonView.layer.cornerRadius = UtilsFunc.doResponsive(20)
        porfilePicture.layer.cornerRadius = UtilsFunc.doResponsive(porfilePicture.frame.size.width / 2.0)

    }
    
    private func updateFonts() {
        greetingsText1.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
        greetingsText2.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(20), weight: .bold)
        titleText1.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .bold)
        titleText2.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .bold)
        titleText3.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(16), weight: .bold)
        titleText4FotnConfig(titleText4: titleText4_1)
        titleText4FotnConfig(titleText4: titleText4_2)
        titleText4FotnConfig(titleText4: titleText4_3)
    }
    
    private func titleText4FotnConfig(titleText4: UILabel) -> Void{
        titleText4.font = UIFont.systemFont(ofSize: UtilsFunc.responsiveText(14), weight: .bold)
    }
    
    
    // MARK: - Add Actions
    private func setupActions() {
//        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc private func actionButtonTapped() {
        print("Botón pulsado")
    }

    private func addLayouts() {
        // ScrollView
        view.addSubview(scrollView)
        
        // Cards
        scrollView.addSubview(containerViewV0)
        // Icons
        scrollView.addSubview(porfilePicture)
        scrollView.addSubview(searchButtonView)
        searchButtonView.addSubview(searchIcon)
        // Texts
        scrollView.addSubview(greetingsText1)
        scrollView.addSubview(greetingsText2)
        scrollView.addSubview(titleText1)
        scrollView.addSubview(titleText2)
        scrollView.addSubview(titleText3)
        
        scrollView.addSubview(titleText4_1)
        scrollView.addSubview(titleText4_2)
        scrollView.addSubview(titleText4_3)
        // ListCards
        scrollView.addSubview(cardListView1)
        scrollView.addSubview(cardListView2)

    }
}
