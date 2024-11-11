import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Fields
    
    // MARK: - UI Components    
    private var containerViewV0: CustomCardV0!
    private var containerViewV1: CustomCardV1!
    private var containerViewV2: CustomCardV2!
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
     
    private let porfilePicture =  UIImageView()
    private let searchIcon =  UIImageView()
    
    private let greetingsText1 =  UILabel()
    private let greetingsText2 =  UILabel()
    private let titleText1 =  UILabel()
    private let titleText2 =  UILabel()
    private let titleText3 =  UILabel()
    private let titleText4_1 =  UILabel()
    private let titleText4_2 =  UILabel()
    private let titleText4_3 =  UILabel()

    private let cardListView = HorizontalCardViewController()

    private let searchButtonView =  UIView()
    
    // MARK: - Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupUI() // Configuración de UI en el inicializador
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("StoryBoard is not be able in this Controller")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayOut()
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        // Self Color Background
        view.backgroundColor = .white
        cardListView.translatesAutoresizingMaskIntoConstraints = false

        // Components Configurations
        configureScrollView()
        configureContentView()
        
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
    
    private func configureContentView() {
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCustomsCards() {
        containerViewV0 = CustomCardV0(position: CGPoint(x: 16, y: 225))
        {
            print("Hola desde Closure Action")
        }
        
        containerViewV1 = CustomCardV1(position: CGPoint(x: 0, y: 0))
        {
            print("Hola desde Closure Action")
        }
        
        containerViewV2 = CustomCardV2(position: CGPoint(x: 16, y: 822))
        {
            print("Hola desde Closure Action")
        }
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
        greetingsText2.text = "Hello, Franco!"
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
        scrollView.frame = CGRect(
            x: 0,
            y: safeArea.top,
            width: view.bounds.width,
            height: view.bounds.height - safeArea.top - safeArea.bottom // Super importante esto
        )
        contentView.frame = CGRect(
                                x: 0,
                                y: 0,
                                width: view.bounds.width,
                                height: UtilsFunc.doResponsive(1538)
        )
        
        // Fit the Scroll Size to ContentView
        scrollView.contentSize = CGSize(width: contentView.bounds.width, height: contentView.bounds.height)
        
        // Cards Responsives
        containerViewV0.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(215))
        cardListView.frame = UtilsFunc.responsiveCGRect(width: UIScreen.main.bounds.width, height: 250, x: 16, y: 545)
//
//            .origin = CGPoint(x: Utils.doResponsive(0), y: Utils.doResponsive(545))
//        cardListView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 234)
        
        containerViewV2.frame.origin = CGPoint(x: UtilsFunc.doResponsive(16), y: UtilsFunc.doResponsive(862))
        
        // Icons
        porfilePicture.frame = UtilsFunc.responsiveCGRect(width: 57, height: 57, x: 18, y: 59)
        searchButtonView.frame = UtilsFunc.responsiveCGRect(width: 57, height: 57, x: 302, y: 59)
        searchIcon.frame.size = CGSize(width: UtilsFunc.doResponsive(70), height: UtilsFunc.doResponsive(15))
        searchIcon.center = CGPoint(x: searchButtonView.bounds.midX, y: searchButtonView.bounds.midY)
        
        // Texts
        greetingsText1.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 80, y: 62)
        greetingsText2.frame = UtilsFunc.responsiveCGRect(width: 135, height: 18, x: 85, y: 87)
        
        titleText1.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 182)
        titleText2.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 513)
        titleText3.frame = UtilsFunc.responsiveCGRect(width: 141, height: 18, x: 8, y: 837)
        titleText4_1.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 182)
        titleText4_2.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 513)
        titleText4_3.frame = UtilsFunc.responsiveCGRect(width: 130, height: 18, x: 267, y: 837)
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
        print(UIScreen.main.bounds.width)
        print(view.bounds.width)
        print(UIScreen.main.bounds.height)
        print(view.bounds.height)
        print("Scroll View: ", scrollView.frame)
        print("Content View:", contentView.frame)
        print(scrollView.contentSize)
        print("Alto: ", contentView.bounds.height)
        print("Horientacion Pantalla: ", view.window!.windowScene!.interfaceOrientation.isPortrait)
    }

    private func addLayouts() {
        // ScrollView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // Cards
        contentView.addSubview(containerViewV0)
//        contentView.addSubview(containerViewV1)
        contentView.addSubview(containerViewV2)
        // Icons
        contentView.addSubview(porfilePicture)
        contentView.addSubview(searchButtonView)
        searchButtonView.addSubview(searchIcon)
        // Texts
        contentView.addSubview(greetingsText1)
        contentView.addSubview(greetingsText2)
        contentView.addSubview(titleText1)
        contentView.addSubview(titleText2)
        contentView.addSubview(titleText3)
        
        contentView.addSubview(titleText4_1)
        contentView.addSubview(titleText4_2)
        contentView.addSubview(titleText4_3)
        contentView.addSubview(cardListView)
    }
}
