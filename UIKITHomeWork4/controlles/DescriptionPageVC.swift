import UIKit

class DescriptionPageVC: UIViewController {
    struct ZodiacSign {
        let name: String
        let description: String
        let image: UIImage
        let polarName: String
        let polarImage: UIImage
    }
    
    let imgLabel = UILabel()
    let image = UIImageView()
    let DescriptionImg = UITextView()
    let polarisName = UILabel()
    let polarisImage = UIImageView()
    let viewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionPageStack: UIStackView = {
        let descriptionPageStack = UIStackView()
        descriptionPageStack.translatesAutoresizingMaskIntoConstraints = false
        descriptionPageStack.backgroundColor = .blue
        return descriptionPageStack
    }()
    
    var zodiacName: String?
    var mainVC: MainPageVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        let image = UIImage(named: "group5")
        viewImage.image = image
        setupUI(for: zodiacName)
    }
    
    func setupUI(for zodiacName: String?) {
        guard let zodiacName = zodiacName else {
            return
        }
        
        var zodiacSign: ZodiacSign
        
        switch zodiacName {
        case "თხისრქა":
            zodiacSign = ZodiacSign(name: "რქებიანი თხა",
                                    description: "აღწერა",
                                    image: UIImage(named: "capricorn")!,
                                    polarName: "კირჩხიბი",
                                    polarImage: UIImage(named: "cancer")!)
        case "მერწყული":
            zodiacSign = ZodiacSign(name: "მერწყული",
                                    description: "აღწერა",
                                    image: UIImage(named: "aquarius")!,
                                    polarName: "ლომი",
                                    polarImage: UIImage(named: "leo")!)
        case "თევზები":
            zodiacSign = ZodiacSign(name: "ორაგული",
                                    description: "აღწერა",
                                    image: UIImage(named: "pisces")!,
                                    polarName: "ქალწული",
                                    polarImage: UIImage(named: "virgo")!)
        case "ვერძი":
            zodiacSign = ZodiacSign(name: "ვ ე რ ძ ი",
                                    description: "აღწერა",
                                    image: UIImage(named: "aries")!,
                                    polarName: "სასწორი",
                                    polarImage: UIImage(named: "libra")!)
        case "კურო":
            zodiacSign = ZodiacSign(name: "კურო",
                                    description: "აღწერა",
                                    image: UIImage(named: "taurus")!,
                                    polarName: "მორიელი",
                                    polarImage: UIImage(named: "Scorpio")!)
            
        case "ტყუპები":
            zodiacSign = ZodiacSign(name: "ტყუპები",
                                    description: "აღწერა",
                                    image: UIImage(named: "gemini")!,
                                    polarName: "სასწორი",
                                    polarImage: UIImage(named: "")!)
        case "კირჩხიბი":
            zodiacSign = ZodiacSign(name: "კირჩხიბი",
                                    description: "აღწერა",
                                    image: UIImage(named: "cancer")!,
                                    polarName: "თხისრქა",
                                    polarImage: UIImage(named: "capricorn")!)
        case "ლომი":
            zodiacSign = ZodiacSign(name: "მიაუ",
                                    description: "აღწერა",
                                    image: UIImage(named: "leo")!,
                                    polarName: "მერწყული",
                                    polarImage: UIImage(named: "Aquarius")!)
        case "ქალწული":
            zodiacSign = ZodiacSign(name: "ქალწული",
                                    description: "აღწერა",
                                    image: UIImage(named: "virgo")!,
                                    polarName: "თევზები",
                                    polarImage: UIImage(named: "Pisces")!)
        case "სასწორი":
            zodiacSign = ZodiacSign(name: "სასწორი",
                                    description: "აღწერა",
                                    image: UIImage(named: "libra")!,
                                    polarName: "ვერძი",
                                    polarImage: UIImage(named: "aries")!)
        case "მორიელი":
            zodiacSign = ZodiacSign(name: "მორიელი",
                                    description: "აღწერა",
                                    image: UIImage(named: "scorpio")!,
                                    polarName: "კურო",
                                    polarImage: UIImage(named: "Taurus")!)
        case "მშვილდოსანი":
            zodiacSign = ZodiacSign(name: "მარიამ სრესელი",
                                    description: "აღწერა",
                                    image: UIImage(named: "sagittarius")!,
                                    polarName: "ტყუპები",
                                    polarImage: UIImage(named: "Gemini")!)
        default:
            
            zodiacSign = ZodiacSign(name: "Default",
                                    description: "Default description",
                                    image: UIImage(named: "default_image")!,
                                    polarName: "ბექა-გიორგი",
                                    polarImage: UIImage(named: "leo")!)
        }
        
        imgLabel.text = zodiacSign.name
        DescriptionImg.text = zodiacSign.description
        image.image = zodiacSign.image
        polarisName.text = zodiacSign.polarName
        polarisImage.image = zodiacSign.polarImage
        
    }
    
    func constraints() {
        let polarSigns = UIButton()
        polarSigns.setTitle("პოლარული ნიშნები", for: .normal)
        polarSigns.addTarget(self, action: #selector(oppositeSignPageVC), for: .touchUpInside)
        
        descriptionPageStack.axis = .vertical
        descriptionPageStack.addArrangedSubview(image)
        descriptionPageStack.addArrangedSubview(imgLabel)
        descriptionPageStack.addArrangedSubview(DescriptionImg)
        descriptionPageStack.addArrangedSubview(polarSigns)
        
        view.addSubview(viewImage)
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: view.topAnchor),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(descriptionPageStack)
        NSLayoutConstraint.activate([
            descriptionPageStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            descriptionPageStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            descriptionPageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionPageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: descriptionPageStack.topAnchor, constant: 50),
            image.leadingAnchor.constraint(equalTo: descriptionPageStack.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: descriptionPageStack.trailingAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: 200), // Adjust height as needed
            
            imgLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            imgLabel.leadingAnchor.constraint(equalTo: descriptionPageStack.leadingAnchor, constant: 10),
            
            DescriptionImg.topAnchor.constraint(equalTo: imgLabel.bottomAnchor, constant: 10),
            DescriptionImg.leadingAnchor.constraint(equalTo: descriptionPageStack.leadingAnchor, constant: 10),
            DescriptionImg.trailingAnchor.constraint(equalTo: descriptionPageStack.trailingAnchor, constant: -10),
            DescriptionImg.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func oppositeSignPageVC() {
        let oppositeVC = OppositeSignPageVC()
        oppositeVC.modalPresentationStyle = .fullScreen
        oppositeVC.polaris = polarisName.text // Pass the polaris name
        oppositeVC.polarisImage = polarisImage.image
        navigationController?.pushViewController(oppositeVC, animated: true)
    }
    
}
#Preview {
    DescriptionPageVC()
}

