
import UIKit


class RatingView: UIView {

    //MARK -- property
    var max = 5.0   //最大的星星数
    var starHeight = 16.0 //星星高度
    var starSpace: Double = 2 //星星间距
    static var KeyNoRating = "KeyNoRating"
    
    var emptyImageViews = [UIImageView]()    //空星星图片数组
    var fullImageViews = [UIImageView]()     //满星星图片数组
    
    var value = 0.0 {
        didSet {
            if value > max {
                value = max
            }else if value < 0 {
                value = 0
            }
            
            for (i,imageView) in fullImageViews.enumerated() {
                let i = Double(i)
                if value >= i+1 {
                    imageView.layer.mask = nil
                    imageView.isHidden = false
                }else if value>i && value < i+1 {
                    let maskLayer = CALayer()
                    maskLayer.frame = CGRect(x: 0, y: 0, width: (value - i) * starHeight, height: starHeight)
                    maskLayer.backgroundColor = UIColor.black.cgColor
                    imageView.layer.mask = maskLayer
                    imageView.isHidden = false
                }else if value <= i {
                    imageView.layer.mask = nil
                    imageView.isHidden = true
                }
            }
        }
    }
    
    
    init(starHeight: Double, max: Double) {
        self.starHeight = starHeight
        self.max = max
        self.starSpace = starHeight * 0.15
        let frame = CGRect(x: 0, y: 0, width: starHeight * max + starSpace * (max - 1), height: starHeight)
        super.init(frame: frame)
        for i in 0...4 {
            let i = Double(i)
            let emptyImageView = UIImageView(image: UIImage(named: "emptyStar"))
            let fullImageView = UIImageView(image: UIImage(named: "fullStar"))
            let frame = CGRect(x: starHeight * i + starSpace * i , y: 0, width: starHeight, height: starHeight)
            emptyImageView.frame = frame
            fullImageView.frame = frame
            emptyImageViews.append(emptyImageView)
            fullImageViews.append(fullImageView)
            addSubview(emptyImageView)
            addSubview(fullImageView)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func showInView(view: UIView, value: Double, max: Double = 5) {
        
        for subView in view.subviews {
            if let subView = subView as? RatingView {
                subView.value = value
                return
            }
        }
        let ratingView = RatingView(starHeight: Double(view.frame.size.height), max: max)
        ratingView.isHidden = false
        view.addSubview(ratingView)
        ratingView.value = value
        
        if let label = objc_getAssociatedObject(view, &KeyNoRating) as? UILabel {
            label.isHidden = true
        }
        
    }
    
    //没有评分，显示无评分的label
    static func showNoRating(view: UIView) {
        for subview in view.subviews {
            if let subview = subview as? RatingView {
                subview.isHidden = true
            }
        }
        
        var label = objc_getAssociatedObject(view, &KeyNoRating) as? UILabel
        if label == nil {
            label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            label!.font = UIFont.systemFont(ofSize: 13)
            view.addSubview(label!)
            label?.text = "暂无评分"
            objc_setAssociatedObject(view, &KeyNoRating, label, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        label?.isHidden = false
        
    }
}
