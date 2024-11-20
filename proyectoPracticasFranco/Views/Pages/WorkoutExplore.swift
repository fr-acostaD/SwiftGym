//
//  WorkoutExplore.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 8/11/24.
//

import UIKit

class ExploreWorkout: UIViewController {

    // MARK: - Constants
    
    // MARK: - Fields
    
    // MARK: - UI Components
    
    // MARK: - Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("StoryBoard is not be able in this Controller")
    }
    
    
    override func loadView() {
        setupUI()
        setupActions()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        setupLayOut()
//    }
    
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Configuration Methods for Subcomponents
    
    // MARK: - Layout
    private func setupLayOut() {
        
    }
    // MARK: - Add Actions
    private func setupActions() {
        
    }
}

