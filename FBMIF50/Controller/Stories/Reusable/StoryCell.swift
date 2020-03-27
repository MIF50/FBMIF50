//
//  StoryCell.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools

class StoryCell: LBTAListCell<String> {
    
    let storiesController = StoriesController(scrollDirection: .horizontal)

    override func setupViews() {
        super.setupViews()
        stack(storiesController.view)
    }
}







#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct StoryCell_Preview: PreviewProvider {
    static var previews: some View {
        StoryCellRepresentable().previewLayout(.fixed(width: 400, height: 200))
    }
}

struct StoryCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return StoryCell()
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

#endif
