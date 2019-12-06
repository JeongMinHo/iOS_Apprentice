//
//  AdView.swift
//  UITableViewSample
//
//  Created by Minseob Yoon on 05/12/2019.
//  Copyright © 2019 Minseob Yoon. All rights reserved.
//

import UIKit

class AdView: UIView {
    
    @IBOutlet private weak var imageView: UIImageView?
    
    override func awakeFromNib() {
        
        // Nib: 구체적인 UI의 구현이 가능하다. 객체지향 관점에서 뷰를 여러 분리된 모듈로 쪼개서 개발, 테스트, 디버그를 더 쉽게 가능하게 한다.
        super.awakeFromNib()
        imageView?.contentMode = .scaleAspectFill
    }
    
    var ad: ChattingList.Ad? {
        didSet {
            resize()
            if let url = URL(string: ad?.imageURL ?? "") {
                if let data = try? Data(contentsOf: url) {
                    imageView?.image = UIImage(data: data)
                    
                    // URL을 불러와서 imageView에 넣어주는 과정
                }
            }
        }
    }
    
    func resize() {
        guard let ad = ad else { return }
        self.frame.size = {
            let width = self.frame.width
            let height: CGFloat = ad.hasAd ? 72 : 0
            return CGSize(width: width, height: height)
        }()
    }
    
    // Ad를 클릭하면 페이지로 넘어가게 해주는 IBAction
    @IBAction private func move(sender: UIButton) {
        // url을 설정, url이 없다면 빈 string으로 return
        guard let url = URL(string: ad?.url ?? "") else {
            return
        }
        // URL을 open할 수 있는지 확인하는 guard문
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        // 앱 안에서 여는 것이 아닌 사파리앱을 통해서 URL 페이지를 열어주는 부분.
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
