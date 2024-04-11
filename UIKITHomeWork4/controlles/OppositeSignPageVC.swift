import UIKit

class OppositeSignPageVC: UIViewController {
    
    let imgLabel = UILabel()
    let image = UIImageView()
    
    let viewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let oppositePageStack: UIStackView = {
        let oppositePageStack = UIStackView()
        oppositePageStack.translatesAutoresizingMaskIntoConstraints = false
        //oppositePageStack.backgroundColor = .blue
        return oppositePageStack
    }()
    
    var polaris: String?
    var polarisImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let polaris = polaris, let polarisImage = polarisImage else { return }
        
        // Set image and label based on polaris
        image.image = polarisImage
        imgLabel.text = polaris
        
        imgLabel.backgroundColor = .red
        image.backgroundColor = .cyan
        
        oppositePageStack.axis = .vertical
        oppositePageStack.addArrangedSubview(image)
        oppositePageStack.addArrangedSubview(imgLabel)
        
        view.addSubview(viewImage)
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: view.topAnchor),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(oppositePageStack)
        NSLayoutConstraint.activate([
            oppositePageStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            oppositePageStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            oppositePageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            oppositePageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: oppositePageStack.topAnchor, constant: 50),
            image.leadingAnchor.constraint(equalTo: oppositePageStack.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: oppositePageStack.trailingAnchor, constant: -10),
            image.heightAnchor.constraint(equalToConstant: 200), // Adjust height as needed
            
            imgLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            imgLabel.leadingAnchor.constraint(equalTo: oppositePageStack.leadingAnchor, constant: 10),
        ])
    }
}

#Preview {
    OppositeSignPageVC()
}
