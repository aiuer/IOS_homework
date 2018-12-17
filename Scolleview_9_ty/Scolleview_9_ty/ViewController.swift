//
//  ViewController.swift
//  Scolleview_9_ty
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        scollview.delegate = self
        
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scollview.bounds.width, y: 0, width: scollview.bounds.width, height: scollview.bounds.height)
            scollview.addSubview(imageView)
        }
        
        scollview.contentSize = CGSize(width: scollview.bounds.width * 7, height: scollview.bounds.height)
        scollview.isPagingEnabled = true
        scollview.showsHorizontalScrollIndicator = false
        
        pagecontrol.numberOfPages = 7
        pagecontrol.currentPage = 0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pagecontrol.currentPage = Int(currentPage)
    }
    @IBAction func clicked(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scollview.bounds.width, y: 0, width: scollview.bounds.width, height: scollview.bounds.height)
        scollview.scrollRectToVisible(rect, animated: true)
    }
    
}

