  
import UIKit
import PlaygroundSupport

class TopBannerPageControl: UIView {
    
    var count: Int?
    var bannerIndex: Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        bannerIndex = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        if let bannerIndex = bannerIndex {
            drawPageControl(index: bannerIndex)
        }
    }
    
    private func drawPageControl(index: Int) {
        guard let count = count, let bannerIndex = bannerIndex else {
            return
        }
        print("\nBanner Index: \(bannerIndex)")
        
        for index in 0...count - 1 {
            var width = 9.0
            var offset = 0.0
            var tailOffset = 12.0
            
            if index < bannerIndex && index == 0 {
                tailOffset = 12.0
            }
            // highlight
            if index >= bannerIndex {
                offset = 12.0
                tailOffset = 24.0
                
//                if index == 1 {
//                    tailOffset = 12.0
//                }
                if index == bannerIndex {
                    width = 21.0
                    tailOffset = 24.0
                }
                if index <= bannerIndex {
                    offset = 0
                }
            }
            let headCirclePath = UIBezierPath(arcCenter: CGPoint(x: Double(index) * (12 + 5) + offset, y: 5),
                                              radius: CGFloat(1.5), startAngle: CGFloat(0),
                                              endAngle: CGFloat(Double.pi * 2), clockwise: true)
            var shapeLayer = CAShapeLayer()
            shapeLayer.path = headCirclePath.cgPath
            shapeLayer.fillColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            
            if index == bannerIndex {
                shapeLayer.fillColor = #colorLiteral(red: 0.9490196078, green: 0.1647058824, blue: 0.1725490196, alpha: 1)
            }
            layer.addSublayer(shapeLayer)
            print("\nIndex: \(index)")
            print("head, \(Double(index) * (12 + 5) + offset)")
            
            let rectangle = UIBezierPath(rect: CGRect(x: Double(index) * (12 + 5) + offset,
                                                      y: 3.5,
                                                      width: width, height: 3.0))
            shapeLayer = CAShapeLayer()
            shapeLayer.path = rectangle.cgPath
            shapeLayer.fillColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            if index == bannerIndex {
                shapeLayer.fillColor = #colorLiteral(red: 0.9490196078, green: 0.1647058824, blue: 0.1725490196, alpha: 1)
            }
            layer.addSublayer(shapeLayer)
            
            let tailCirclePath = UIBezierPath(arcCenter: CGPoint(x: Double(index) * (12 + 5) + tailOffset - 3, y: 5),
                                              radius: CGFloat(1.5), startAngle: CGFloat(0),
                                              endAngle: CGFloat(Double.pi * 2), clockwise: true)
            shapeLayer = CAShapeLayer()
            shapeLayer.path = tailCirclePath.cgPath
            shapeLayer.fillColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
            if index == bannerIndex {
                shapeLayer.fillColor = #colorLiteral(red: 0.9490196078, green: 0.1647058824, blue: 0.1725490196, alpha: 1)
            }
            layer.addSublayer(shapeLayer)
            print("tail, \(Double(index) * (12 + 5) + tailOffset)")
        }
    }
    
}

class MyViewController : UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        let view = TopBannerPageControl(frame: CGRect(x: 20, y: 200, width: 200, height: 10))
        view.bannerIndex = 3
        view.count = 5
        
        self.view.addSubview(view)
    }
}

PlaygroundPage.current.liveView = MyViewController()
