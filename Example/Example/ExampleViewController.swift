import UIKit
import StickySugar

class ExampleViewController: UIViewController {
    
    lazy var banner = UIImageView(style: Stylesheet.banner)
    lazy var icon = UIImageView(style: Stylesheet.icon)
    lazy var titleLabel = UILabel(style: Stylesheet.titleLabel)

    var bannerHeight: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        VSugarStack(
            self.banner.sugar.size(toHeight: 300),
            self.icon.sugar.aspectHeightToWidth()
        )
        .sugar
        .stickToParentEdges()
    }
}

extension ExampleViewController {
    enum Stylesheet {
        static let banner = Style<UIImageView> {
            $0.backgroundColor = .red
        }
        
        static let icon = Style<UIImageView> {
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 25
        }
        
        static let titleLabel = Style<UILabel> {
            $0.font = UIFont.boldSystemFont(ofSize: 22)
            $0.text = "An awesome app"
            $0.numberOfLines = 0
        }
        
        static let subtitleLabel = Style<UILabel> {
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textColor = .gray
            $0.numberOfLines = 0
            $0.text = "Awesome App Builders Corp."
        }
        
        static let actionButton = Style<UIButton> {
            $0.backgroundColor = .blue
            $0.setTitle("OPEN", for: .normal)
        }
        
        static let moreButton = Style<UIButton> {
            $0.backgroundColor = .blue
            $0.setTitle("...", for: .normal)
        }
        
        static let previewLabel = Style<UILabel> {
            $0.font = UIFont.boldSystemFont(ofSize: 22)
            $0.text = "Preview"
        }
        
        static let textView = Style<UITextView> {
            $0.backgroundColor = .yellow
        }
    }
}
