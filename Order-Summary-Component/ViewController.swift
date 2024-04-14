//
//  ViewController.swift
//  Order-Summary-Component
//
//  Created by Marcos Fabian Chong Megchun on 11/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let mainStack = UIStackView()
    let planDetailsStack = UIStackView()
    let imageView = UIImageView()
    let orderSummaryLabel = UILabel()
    let descriptionLabel = UILabel()
    let proceedBtn = UIButton(type: .system)
    let cancelBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Pale-Blue")
        configureCardView()
        configureMainStack()
        configureImageView()
        configureOrderSummaryLabel()
        configureDescriptionLabel()
        configurePlanDetailsStack()
        configureProceedButton()
        configureCancelButton()
    }
    
    func configureCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .white
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 20
        cardView.addSubview(imageView)
        cardView.addSubview(mainStack)
        cardView.addSubview(proceedBtn)
        cardView.addSubview(cancelBtn)
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 340),
            cardView.heightAnchor.constraint(equalToConstant: 570)
        ])
        
    }
    
    
    func configureMainStack () {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.spacing = 24
        mainStack.distribution = .fill
        mainStack.alignment = .fill
        
        mainStack.addArrangedSubview(orderSummaryLabel)
        mainStack.addArrangedSubview(descriptionLabel)
        mainStack.addArrangedSubview(planDetailsStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            mainStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
        ])
    }
    
    func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "illustration-hero")
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 340),
            imageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func configureOrderSummaryLabel() {
        orderSummaryLabel.text = "Order summary"
        orderSummaryLabel.textColor = UIColor(named: "Dark-Blue")
        orderSummaryLabel.textAlignment = .center
        orderSummaryLabel.font = UIFont(name: "RedHatDisplay-Black", size: 28)
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.text = "You can now listen to millions of song, audiobooks, and podcasts on any device anywhere you like!"
        descriptionLabel.textColor = UIColor(named: "Dark-Blue")
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 5
        descriptionLabel.font = UIFont(name: "RedHatDisplay-Medium", size: 16)
        descriptionLabel.textColor = UIColor(named: "Desaturated-Blue")
    }
    
    func configureProceedButton() {
            proceedBtn.translatesAutoresizingMaskIntoConstraints = false
            proceedBtn.setTitle("Proceed to payment", for: .normal)
            proceedBtn.backgroundColor = UIColor(named: "Bright-Blue")
            proceedBtn.titleLabel?.font =  UIFont(name: "RedHatDisplay-Black", size: 16)
            proceedBtn.tintColor = .white
            proceedBtn.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            proceedBtn.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 25),
            proceedBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            proceedBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            proceedBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureCancelButton() {
            cancelBtn.translatesAutoresizingMaskIntoConstraints = false
            cancelBtn.titleLabel?.font =  UIFont(name: "RedHatDisplay-Black", size: 16)
            cancelBtn.setTitle("Cancel Order", for: .normal)
            cancelBtn.tintColor = UIColor(named: "Desaturated-Blue")
        
        NSLayoutConstraint.activate([
            cancelBtn.topAnchor.constraint(equalTo: proceedBtn.bottomAnchor, constant: 10),
            cancelBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cancelBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
        ])
    }
    
    func configurePlanDetailsStack() {
        
        let detailsImage: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y:0, width: 40, height: 40))
            imageView.image = UIImage(named: "icon-music")
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let priceVerticalStack: UIStackView = {
            let stack = UIStackView()
            let plan = UILabel()
            let price = UILabel()
            
            plan.text = "Annual Plan"
            plan.textColor = UIColor(named: "Dark-Blue")
            plan.font = UIFont(name: "RedHatDisplay-Black", size: 16)
            price.text = "$59.99/year"
            price.textColor = UIColor(named: "Desaturated-Blue")
            price.font = UIFont(name: "RedHatDisplay-Medium", size: 16)
            
            
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 5
            stack.addArrangedSubview(plan)
            stack.addArrangedSubview(price)
            return stack
        }()
        
        let changeButton: UIButton = {
            let changeButton = UIButton(type: .system)
            changeButton.setTitle("Change", for: .normal)
            changeButton.titleLabel?.font =  UIFont(name: "RedHatDisplay-Bold", size: 16)
            changeButton.tintColor = UIColor(named: "Bright-Blue")
            changeButton.underline()
            
            return changeButton
            
        }()
        
        planDetailsStack.addArrangedSubview(detailsImage)
        planDetailsStack.addArrangedSubview(priceVerticalStack)
        planDetailsStack.addArrangedSubview(changeButton)
        planDetailsStack.isLayoutMarginsRelativeArrangement = true
        planDetailsStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        
        planDetailsStack.axis = .horizontal
        planDetailsStack.distribution = .fillProportionally
        planDetailsStack.alignment = .center
        planDetailsStack.backgroundColor = UIColor(named: "VeryPale-Blue")
        planDetailsStack.layer.cornerRadius = 10
    }


}

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

