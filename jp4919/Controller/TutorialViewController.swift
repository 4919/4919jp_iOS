//
//  TutorialViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/28.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate{
    
    let NUMPAGES = 4
    
    @IBOutlet weak var backgtoundView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.size.width
        let screenHeight = self.view.frame.size.height
        

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: (self.view.frame.size.width * CGFloat(NUMPAGES)), height: screenHeight)
        
        pageControl.numberOfPages = NUMPAGES
        
        // チュートリアルの中身
        // 1つ目
        let redView = UIView(frame: CGRect(x: 0, y: 0,
                                           width: screenWidth, height: screenHeight))
        redView.backgroundColor = UIColor.orange
        
        let firstImage:UIImage = UIImage(named:"Tutorial1")!
        let firstResize = CGSize(width: screenWidth * screenHeight / firstImage.size.height, height: screenHeight)
        let firstTutorialView = UIImageView(image: firstImage.reSizeImage(reSize: firstResize))
        firstTutorialView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        redView.addSubview(firstTutorialView)
        scrollView.addSubview(redView)
        
        // 2つ目
        let blueView = UIView(frame: CGRect(x: screenWidth, y: 0,
                                            width: screenWidth, height: screenHeight))
        blueView.backgroundColor = UIColor.blue
        
        let secondImage:UIImage = UIImage(named:"Tutorial2")!
        let secondResize = CGSize(width: screenWidth * screenHeight / secondImage.size.height, height: screenHeight)
        let secondTutorialView = UIImageView(image: secondImage.reSizeImage(reSize: secondResize))
        secondTutorialView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        blueView.addSubview(secondTutorialView)
        scrollView.addSubview(blueView)
        
        
        // 3つ目
        let yellowView =
            UIView(frame: CGRect(x: (screenWidth * 2),
                                 y: 0, width: screenWidth, height: screenHeight))
        yellowView.backgroundColor = UIColor.yellow
        
        let thirdImage:UIImage = UIImage(named:"Tutorial3")!
        let thirdResize = CGSize(width: screenWidth * screenHeight / thirdImage.size.height, height: screenHeight)
        let thirdTutorialView = UIImageView(image: thirdImage.reSizeImage(reSize: thirdResize))
        thirdTutorialView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        yellowView.addSubview(thirdTutorialView)
        scrollView.addSubview(yellowView)
        
        // 4つ目
        let greenView =
            UIView(frame: CGRect(x: (screenWidth * 3),
                                 y: 0, width: screenWidth, height: screenHeight))
        greenView.backgroundColor = UIColor.green
        
        let cautionImage:UIImage = UIImage(named:"Caution")!
        let cautionResize = CGSize(width: screenWidth * screenHeight / cautionImage.size.height, height: screenHeight)
        let cautionView = UIImageView(image: cautionImage.reSizeImage(reSize: cautionResize))
        cautionView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        greenView.addSubview(cautionView)

        // 承認ボタンを追加
        let buttonWidth = 200
        let buttonHeight = 40
        
//        let scrollviewWidth = scrollView.frame.width
//        let scrollviewHeight = scrollView.frame.height
        
        let registerButton: ButtonCustom = ButtonCustom()
        registerButton.frame = CGRect(x:(Int(screenWidth/2) - Int(buttonWidth)/2), y:(Int(screenHeight) - buttonHeight),width:buttonWidth, height:buttonHeight)
        
        registerButton.setTitle("承認して始める", for: UIControlState.normal)
        registerButton.backgroundColor = UIColor.blue
        registerButton.cornerRadius = CGFloat(buttonHeight/2)
        
        registerButton.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
        
        greenView.addSubview(registerButton)
        scrollView.addSubview(greenView)
        
        // scrollviewに登録
        self.view.addSubview(scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth : CGFloat = self.scrollView.frame.size.width
        let fractionalPage : Double = Double(self.scrollView.contentOffset.x / pageWidth)
//        print(fractionalPage)
        let page : NSInteger = lround(fractionalPage)
        self.pageControl.currentPage = page
    }
    
    // ボタン押下時のイベント
    @objc func buttonEvent(_ sender: ButtonCustom){
        let storyboard = UIStoryboard(name: "AreaSetting", bundle: nil)
        let locationVC = storyboard.instantiateInitialViewController() as! AreaSettingViewController
        self.present(locationVC, animated: true)
    }

    override func didReceiveMemoryWarning() {

    }

}
