//
//  BottomNavigation.swift
//  FoodRescure
//
//  Created by Thao Vo on 28/07/2023.
//


import UIKit

class BottomNavigation: UIView {
    
    var viewBG = UIView()
    var homeView = UIView()
    var searchView = UIView()
    var postView = UIView()
    var userView = UIView()
    var notiView = UIView()
    var HomeImage = UIImageView(image: UIImage(named: "ic_home"))
    var searchImage = UIImageView(image: UIImage(named: "ic_search"))
    var postImage = UIImageView(image: UIImage(named: "ic_plus"))
    var userImage = UIImageView(image: UIImage(named: "ic_user"))
    var notiImage = UIImageView(image: UIImage(named: "ic_noti"))
    var homeLabel = UILabel()
    var searchLabel = UILabel()
    var postLabel = UILabel()
    var userLabel = UILabel()
    var notiLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){
//        rgb(97, 177, 90)
        self.backgroundColor = UIColor(red: 97/255.0, green: 177/255.0, blue: 90/255.0, alpha: 1)
        viewBG.layer.cornerRadius = 16
        self.layer.cornerRadius = 16
        homeView.layer.cornerRadius = 16
        userView.layer.cornerRadius = 16
        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewBG.backgroundColor = .clear
        
        homeView.backgroundColor = .clear
        searchView.backgroundColor = .clear
        postView.backgroundColor = .clear
        userView.backgroundColor = .clear
        notiView.backgroundColor = .clear
        
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        postView.translatesAutoresizingMaskIntoConstraints = false
        userView.translatesAutoresizingMaskIntoConstraints = false
        notiView.translatesAutoresizingMaskIntoConstraints = false
        
        HomeImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        notiImage.translatesAutoresizingMaskIntoConstraints = false
        
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        notiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        homeLabel.text = "Home"
        searchLabel.text = "Search"
        postLabel.text = "Post"
        userLabel.text = "User"
        notiLabel.text = "Notification"
        
        homeLabel.textColor = .white
        searchLabel.textColor = .white
        postLabel.textColor = .white
        userLabel.textColor = .white
        notiLabel.textColor = .white
        
        homeLabel.font = UIFont.systemFont(ofSize: 12.0)
        searchLabel.font = UIFont.systemFont(ofSize: 12.0)
        postLabel.font = UIFont.systemFont(ofSize: 12.0)
        userLabel.font = UIFont.systemFont(ofSize: 12.0)
        notiLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        homeView.addSubview(HomeImage)
        homeView.addSubview(homeLabel)
        
        searchView.addSubview(searchImage)
        searchView.addSubview(searchLabel)
        
        postView.addSubview(postImage)
        postView.addSubview(postLabel)
        
        userView.addSubview(userImage)
        userView.addSubview(userLabel)
        
        notiView.addSubview(notiImage)
        notiView.addSubview(notiLabel)
        
        viewBG.addSubview(homeView)
        viewBG.addSubview(searchView)
        viewBG.addSubview(postView)
        viewBG.addSubview(notiView)
        viewBG.addSubview(userView)
        
        self.addSubview(viewBG)
        
        
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            homeView.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/5),
            searchView.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/5),
            postView.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/5),
            notiView.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/5),
            userView.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/5),
            
            homeView.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            searchView.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            postView.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            notiView.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            userView.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            
            
            homeView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            homeView.leadingAnchor.constraint(equalTo: viewBG.leadingAnchor, constant: 0),
            
            searchView.leadingAnchor.constraint(equalTo: homeView.trailingAnchor, constant: 0),
            searchView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            postView.leadingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: 0),
            postView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            notiView.leadingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0),
            notiView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            userView.leadingAnchor.constraint(equalTo: notiView.trailingAnchor, constant: 0),
            userView.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            HomeImage.widthAnchor.constraint(equalToConstant: 30),
            HomeImage.heightAnchor.constraint(equalToConstant: 30),
            
            searchImage.widthAnchor.constraint(equalToConstant: 30),
            searchImage.heightAnchor.constraint(equalToConstant: 30),
            
            postImage.widthAnchor.constraint(equalToConstant: 30),
            postImage.heightAnchor.constraint(equalToConstant: 30),
            
            userImage.widthAnchor.constraint(equalToConstant: 30),
            userImage.heightAnchor.constraint(equalToConstant: 30),
            
            notiImage.widthAnchor.constraint(equalToConstant: 30),
            notiImage.heightAnchor.constraint(equalToConstant: 30),
            
            HomeImage.topAnchor.constraint(equalTo: homeView.topAnchor, constant: 8),
            HomeImage.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            
            searchImage.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 8),
            searchImage.centerXAnchor.constraint(equalTo: searchView.centerXAnchor),
            
            postImage.topAnchor.constraint(equalTo: postView.topAnchor, constant: 8),
            postImage.centerXAnchor.constraint(equalTo: postView.centerXAnchor),
            
            userImage.topAnchor.constraint(equalTo: userView.topAnchor, constant: 8),
            userImage.centerXAnchor.constraint(equalTo: userView.centerXAnchor),
            
            notiImage.topAnchor.constraint(equalTo: notiView.topAnchor, constant: 8),
            notiImage.centerXAnchor.constraint(equalTo: notiView.centerXAnchor),
            
            homeLabel.topAnchor.constraint(equalTo: HomeImage.bottomAnchor, constant: 7),
            homeLabel.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            
            searchLabel.topAnchor.constraint(equalTo: searchImage.bottomAnchor, constant: 7),
            searchLabel.centerXAnchor.constraint(equalTo: searchView.centerXAnchor),
            
            postLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 7),
            postLabel.centerXAnchor.constraint(equalTo: postView.centerXAnchor),
            
            userLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 7),
            userLabel.centerXAnchor.constraint(equalTo: userView.centerXAnchor),
            
            notiLabel.topAnchor.constraint(equalTo: notiImage.bottomAnchor, constant: 7),
            notiLabel.centerXAnchor.constraint(equalTo: notiView.centerXAnchor),
            
        ])
        homeView.isUserInteractionEnabled = true
        let gestureHome = UITapGestureRecognizer(target: self, action:  #selector (self.goHome))
        homeView.addGestureRecognizer(gestureHome)
        
        let gestureSearch = UITapGestureRecognizer(target: self, action:  #selector (self.goSaved))
        searchView.addGestureRecognizer(gestureSearch)
        
        let tapPosting = UITapGestureRecognizer(target: self, action: #selector(self.goBooking))
        postView.addGestureRecognizer(tapPosting)
        
        let tapUser = UITapGestureRecognizer(target: self, action: #selector(self.goSetting))
        userView.addGestureRecognizer(tapUser)
        
        let tapNoti = UITapGestureRecognizer(target: self, action: #selector(self.goSetting))
        notiView.addGestureRecognizer(tapNoti)
        
    }
    @objc func goHome(){
        print(10)
        if let navigationController = self.window?.rootViewController as? UINavigationController {
//            let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    @objc func goSaved(){
//        if let navigationController = self.window?.rootViewController as? UINavigationController {
//            let SavedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController") as! SavedViewController
//            navigationController.pushViewController(SavedVC, animated: true)
//        }
    }
    @objc func goBooking(){
//        if let navigationController = self.window?.rootViewController as? UINavigationController {
//            let SavedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookingVC") as! BookingVC
//            navigationController.pushViewController(SavedVC, animated: true)
//        }
        
    }
    @objc func goSetting(){
//        print(1)
        
    }
}
