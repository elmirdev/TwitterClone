//
//  ProfileImageController.swift
//  TwitterClone
//
//  Created by ELMIR ISMAYILZADA on 19.05.22.
//

import UIKit

class ProfileImageController: UIViewController{
    // MARK: - Properties
    
    private let user: User
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationBar()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .black
        view.addSubview(profileImageView)
        profileImageView.addConstraintsToFillView(view)
        profileImageView.sd_setImage(with: user.profileImageUrl)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
