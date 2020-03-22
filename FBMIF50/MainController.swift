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


class PostCell: LBTAListCell<String> {
    
    let imageView: UIImageView = {
       let img = UIImageView(backgroundColor: .red)
        img.withHeight(40).withWidth(40)
        return img
    }()
    
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11 Am")
    let postTextLabel = UILabel(text: "Here is my post text ")
    let imageViewGrid = UIView(backgroundColor: .yellow)
    
    override func setupViews() {
        backgroundColor = .white
        arrangeLayout()
        
    }
    
    private func arrangeLayout(){
        let vstack = stack(nameLabel,dateLabel)
        let hStack = hstack(imageView,vstack,spacing: 8).padLeft(12).padRight(12).padTop(12)
        stack(hStack, postTextLabel,imageViewGrid,spacing: 8)
    }
}


class MainController: LBTAListController<PostCell,String> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
        
        self.items = ["hello", "wolrd","1","2"]
    }
    
    private func initCollectionView(){
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
    }
}

//MARK:- Collection View Delegate Flow Layout
extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}









// to preview desing form SwiftUI
struct MainPreview: PreviewProvider{

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
