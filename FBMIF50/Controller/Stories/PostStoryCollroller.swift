//
//  PostStoryCollroller.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools
import SwiftUI

class PostStoryCollroller: LBTAListHeaderController<StoryCell,String,CreatePostHeader> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
    }
    
    fileprivate func initCollectionView() {
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        items = ["test"]
    }
    
}




//MARK:- Collection View Delegate Flow Layout
extension PostStoryCollroller: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return .init(width: 0, height: 130 )
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 0, right: 0)
    }
    
    
}




/////  to preview desing form SwiftUI
struct PostStoryPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
             return PostStoryCollroller()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }

    }
}
