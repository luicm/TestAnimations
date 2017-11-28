
import UIKit
import Hero

class ProductViewController: UIViewController {

    var product: [String: Any]!
    var panGR: UIPanGestureRecognizer!
    
    @IBOutlet weak var productImage: UIImageView! {
        didSet {
            productImage.image = product["image"] as? UIImage
            let name = product["name"] as! String
            productImage.heroID = "image_\(name)"
            productImage.heroModifiers = [.duration(0.3)]
        }
    }
    @IBOutlet weak var productNameLabel: UILabel! {
        didSet {
            productNameLabel.text = product["name"] as? String
            let name = product["name"] as! String
            productNameLabel.heroID = "name_\(name)"
        }
    }
    @IBOutlet weak var productDescriptionLabel: UILabel! {
        didSet {
            productDescriptionLabel.heroID = "product_description"
            productDescriptionLabel.heroModifiers = [.fade]
        }
    }
    
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isHeroEnabled = true
//        self.heroModalAnimationType = .cover(direction: .up)
        self.heroModalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .uncover(direction: .down))
        
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonWasTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func handlePan(gestureRecognizer:UIPanGestureRecognizer) {
        
        // calculate the progress based on how far the user moved
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began:
            // begin the transition as normal
            dismiss(animated: true, completion: nil)
        case .changed:
            
            Hero.shared.update(progress)
            
            // update views' position (limited to only vertical scroll)
            let imagePosition = CGPoint(x: productImage.center.x,
                                        y: translation.y + productImage.center.y)
            let namePosition = CGPoint(x: productNameLabel.center.x,
                                       y: translation.y + productNameLabel.center.y)
            let descriptionPosition = CGPoint(x: productDescriptionLabel.center.x,
                                              y: translation.y + productDescriptionLabel.center.y)
            
            // update views' position based on the translation
            Hero.shared.apply(modifiers: [.position(imagePosition)], to: productImage)
            Hero.shared.apply(modifiers: [.position(namePosition)], to: productNameLabel)
            Hero.shared.apply(modifiers: [.position(descriptionPosition)], to: productDescriptionLabel)
            
        default:
            // finish or cancel the transition based on the progress and user's touch velocity
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
}

// define a small helper function to add two CGPoints
fileprivate func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
