//
//  StoriesController.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/24/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class StoryPhotoCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Lee Ji Eun", font: .boldSystemFont(ofSize: 14), textColor: .white)
    
    override func setupViews() {
        imageView.layer.cornerRadius = 8
        
        stack(imageView)
        setupGradientLayout()
        stack(UIView(),nameLabel).withMargins(.allSides(8))
    }
    
    
    let gradientLayout  = CAGradientLayer()
    
    fileprivate func setupGradientLayout(){
        gradientLayout.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayout.locations = [0.6,1.1]
        gradientLayout.cornerRadius = 8
        clipsToBounds = true
        layer.addSublayer(gradientLayout)
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        gradientLayout.frame = bounds
    }
}

class StoriesController: LBTAListController<StoryPhotoCell,String> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["photo1","avatar1","avatar1","avatar1","avatar1","avatar1"]
    }
}


//MARK:- Collection View Delegate Flow Layout
extension StoriesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
    }
}









///  to preview desing form SwiftUI
struct StoriesPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<StoriesPreview.ContainerView>) -> UIViewController {
            return StoriesController()
        }
        
        func updateUIViewController(_ uiViewController: StoriesPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<StoriesPreview.ContainerView>) {
            
        }
        
        
    }
}
