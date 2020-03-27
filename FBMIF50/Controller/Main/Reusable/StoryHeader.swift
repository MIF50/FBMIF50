//
//  StoryHeader.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools



class StoryHeader: UICollectionReusableView {
    
//    let storiesController = StoriesController(scrollDirection: .horizontal)
    let postStoryVC = PostStoryCollroller()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        
        stack(postStoryVC.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct StoryHeader_Preview: PreviewProvider {
    static var previews: some View {
        StoryHeaderRepresentable().previewLayout(.fixed(width: 400, height: 500))
    }
}

struct StoryHeaderRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return StoryHeader()
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

#endif
