import UIKit

class MainPageVC: UIViewController {
    
    let textField = UITextField()
    
    let viewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainPageStack: UIStackView = {
        let mainPageStack = UIStackView()
        mainPageStack.translatesAutoresizingMaskIntoConstraints = false
        return mainPageStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStack()
        //view.addSubview(button)
        let image = UIImage(named: "group5")
        viewImage.image = image
    }
    
    func configureStack() {
        
        let mainLabel = UILabel()
        mainLabel.text = "მიშა ცაგარელის ჰაბი"
        mainLabel.textColor = .white
        mainLabel.font = .systemFont(ofSize: 25)
        
        let mainLabelsText = UITextView()
        mainLabelsText.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები"
        mainLabelsText.textColor = .black // ვიცი რო შავი არარის მაგრამ სხვანაირად ვერ გადმოვიტანე ბექროუნდის სურათი და იმ ფერზე არ ჩანს ნაცრისფერი ტექსტით
        mainLabelsText.font = .systemFont(ofSize: 15)
        mainLabelsText.backgroundColor = .none
        
        let textFieldLabel = UILabel()
        textFieldLabel.text = "ზოდიაქოს სახელი"
        textFieldLabel.textColor = .white
        
        textField.placeholder = "მაგ: ქალწული"
        textField.borderStyle = .line
        
        let nextButton = UIButton()
        nextButton.setTitle("შემდეგ", for: .normal)
        nextButton.addTarget(self, action: #selector(descriptionPageVC), for: .touchUpInside)
        
        mainPageStack.axis = .vertical
        mainPageStack.distribution = .fillEqually
        mainPageStack.alignment = .leading
        mainPageStack.spacing = 10
        
        mainPageStack.addArrangedSubview(mainLabel)
        mainPageStack.addArrangedSubview(mainLabelsText)
        mainPageStack.addArrangedSubview(textFieldLabel)
        mainPageStack.addArrangedSubview(textField)
        mainPageStack.addArrangedSubview(nextButton)
        
        view.addSubview(viewImage)
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: view.topAnchor),
            viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(mainPageStack)
        NSLayoutConstraint.activate([
            mainPageStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainPageStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            mainPageStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainPageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: mainPageStack.topAnchor, constant: 0),
            mainLabel.leadingAnchor.constraint(equalTo: mainPageStack.leadingAnchor, constant: 0),
            mainLabel.trailingAnchor.constraint(equalTo: mainPageStack.trailingAnchor, constant: 0),
            
            mainLabelsText.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            mainLabelsText.leadingAnchor.constraint(equalTo: mainPageStack.leadingAnchor, constant: 0),
            mainLabelsText.trailingAnchor.constraint(equalTo: mainPageStack.trailingAnchor, constant: 0),
            mainLabelsText.bottomAnchor.constraint(equalTo: textFieldLabel.topAnchor, constant: -10),
            
            textFieldLabel.topAnchor.constraint(equalTo: mainLabelsText.bottomAnchor, constant: 10),
            textFieldLabel.leadingAnchor.constraint(equalTo: mainPageStack.leadingAnchor, constant: 0),
            textFieldLabel.trailingAnchor.constraint(equalTo: mainPageStack.trailingAnchor, constant: 0),
            
            textField.topAnchor.constraint(equalTo: textFieldLabel.bottomAnchor, constant: 3),
            textField.leadingAnchor.constraint(equalTo: mainPageStack.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: mainPageStack.trailingAnchor, constant: 0),
            
            nextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            nextButton.leadingAnchor.constraint(equalTo: mainPageStack.leadingAnchor, constant: 0),
            nextButton.trailingAnchor.constraint(equalTo: mainPageStack.trailingAnchor, constant: 0),
        ])
    }
    @objc func descriptionPageVC() {
        let descriptionVC = DescriptionPageVC()
        descriptionVC.modalPresentationStyle = .fullScreen
        descriptionVC.mainVC = self
        descriptionVC.zodiacName = textField.text
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
}

#Preview {
    MainPageVC()
}

