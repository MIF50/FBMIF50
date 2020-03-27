//
//  MainController.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/22/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools


class MainController: LBTAListHeaderController<PostCell,String,StoryHeader> {
    
    // outlite nav bar
    let fbLogo: UIImageView = {
        let img = UIImageView(image: UIImage(named: "fb_logo"), contentMode: .scaleAspectFit)
        img.withWidth(120)
        return img
    }()
    
    let searchBtn: UIButton =  {
        let btn = UIButton(image: UIImage(named: "search")!, tintColor: .black)
        btn.withWidth(34).withHeight(34)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 17
        btn.backgroundColor  = UIColor.init(white: 0.9, alpha: 1)
        return btn
    }()
    
    let messengerBtn: UIButton = {
        let btn = UIButton(image: UIImage(named: "messenger")!, tintColor: .black)
        btn.withWidth(34).withHeight(34)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 17
        btn.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
        setupNavBar()
        
    }
    
    private func initCollectionView(){
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        self.items = ["hello", "wolrd","1","2"]

    }
    
    
    fileprivate func setupNavBar() {
        let coverWhiteView = UIView(backgroundColor: .white)
        view.addSubview(coverWhiteView)
        coverWhiteView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        let topSafeArea = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        coverWhiteView.withHeight(topSafeArea)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        let lessWidth: CGFloat = 34 + 34 + 120 + 16 + 24
        let width = view.frame.width - lessWidth
        let navView = UIView()
        navView.frame = .init(x: 0, y: 0, width: width, height: 50)
        navView.hstack(fbLogo,UIView(backgroundColor: .clear).withWidth(width),searchBtn,messengerBtn,spacing: 8)
            .padBottom(8)
        navigationItem.titleView = navView
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaTop = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
        let magicalSafeAreaTop: CGFloat = safeAreaTop + (navigationController?.navigationBar.frame.height ?? 0)
        let offset = scrollView.contentOffset.y + magicalSafeAreaTop
        let alpha: CGFloat = 1 - (scrollView.contentOffset.y + magicalSafeAreaTop) / magicalSafeAreaTop

        [fbLogo,searchBtn,messengerBtn].forEach { $0.alpha  = alpha }
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
        
        print("y = \(scrollView.contentOffset.y) alph = \(alpha)")

    }
}



//MARK:- Collection View Delegate Flow Layout
extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return .init(width: 0, height: 230 + 130 + 12)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 0, right: 0)
    }
    
    
}




// to preview desing form SwiftUI
struct MainPreview: PreviewProvider{

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: MainController())
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
