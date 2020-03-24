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
    let photoGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        arrangeLayout()
        
    }
    
    private func arrangeLayout(){
        let vstack = stack(nameLabel,dateLabel)
        let hStack = hstack(imageView,vstack,spacing: 8).padLeft(12).padRight(12).padTop(12)
        stack(hStack, postTextLabel,photoGridController.view,spacing: 8)
    }
}

class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoriesController(scrollDirection: .horizontal)
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        stack(storiesController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class MainController: LBTAListHeaderController<PostCell,String,StoryHeader> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
        
    }
    
    private func initCollectionView(){
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        self.items = ["hello", "wolrd","1","2"]

    }
}

//MARK:- Collection View Delegate Flow Layout
extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
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
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
    }
}
