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


class StoriesController: LBTAListController<StoryPhotoCell,String> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["photo1","avatar1","avatar1","avatar1","avatar1"]
    }
}


//MARK:- Collection View Delegate Flow Layout
extension StoriesController: UICollectionViewDelegateFlowLayout {
    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//         return .init(width: 0, height: 120)
//       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 230
        return .init(width: 120, height: height - 24 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 12, bottom: 0, right: 12)
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
