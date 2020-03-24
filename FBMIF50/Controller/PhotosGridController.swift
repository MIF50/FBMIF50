//
//  PhotosGridController.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/22/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "avatar1"), contentMode: .scaleAspectFill)
        return img
    }()
    
    override func setupViews() {
        backgroundColor = .yellow
        stack(imageView)
    }
}

class PhotosGridController: LBTAListController<PhotoGridCell,String> {
    let cellSpacing: CGFloat = 4

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
    }
    
    private func initCollectionView(){
        collectionView.backgroundColor = .lightGray
        self.items = ["avatar1","story_photo1","story_photo2","avatar1","avatar1"]

    }
    
    
}




//MARK:- Collection View Delegate Flow Layout
extension PhotosGridController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.items.count == 4 {
            // do 4 grid cell layout here 
        }
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 3 * cellSpacing) / 2
            return .init(width: width, height: width)
        } else {
            let width = (view.frame.width - 4.1 * cellSpacing) / 3
            return .init(width: width, height: width)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
}



// to preview desing form SwiftUI
struct PhotoPreview: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPreview.ContainerView>) -> UIViewController {
            return PhotosGridController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PhotoPreview.ContainerView>) {
            
        }
    }
}
