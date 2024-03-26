//
//  UIScrollView.swift
//  Beeda Driver
//
//  Created by Silver Wolfe on 19/1/23.
//  Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    var scrolledToTop: Bool {
        let topEdge = 0 - contentInset.top
        return contentOffset.y <= topEdge
    }
    
    var scrolledToBottom: Bool {
        let bottomEdge = contentSize.height + contentInset.bottom - bounds.height
        return contentOffset.y >= bottomEdge
    }
}

public extension UIScrollView {
    func scrollToTopView() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
    
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
    
    func scrollTo(direction: ScrollDirection, animated: Bool = true) {
        if self.contentSize.height > UIScreen.main.bounds.height{
            self.setContentOffset(direction.contentOffsetWith(scrollView: self), animated: animated)
        }
    }
    
    //MARK- ScrollView Contentsize
    enum ScrollDirection {
        case Top
        case Right
        case Bottom
        case Left
        
        func contentOffsetWith(scrollView: UIScrollView) -> CGPoint {
            var contentOffset = CGPoint.zero
            switch self {
                case .Top:
                    contentOffset = CGPoint(x: 0, y: -scrollView.contentInset.top)
                case .Right:
                    contentOffset = CGPoint(x: scrollView.contentSize.width - scrollView.bounds.size.width, y: 0)
                case .Bottom:
                    contentOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
                case .Left:
                    contentOffset = CGPoint(x: -scrollView.contentInset.left, y: 0)
            }
            
            return contentOffset
        }
    }
}
