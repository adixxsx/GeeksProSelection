//
//  CharacterTableViewCell.swift
//  GeeksProSelection
//
//  Created by user on 25/5/24.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var character: Character
    let imageView = UIImageView()
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadImage()
    }
    
    func setupUI() {
        let nameLabel = UILabel()
        nameLabel.text = character.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        let statusLabel = UILabel()
        statusLabel.text = character.status
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        switch character.status {
        case "Alive":
            statusLabel.textColor = .green
        case "Dead":
            statusLabel.textColor = .red
        default:
            statusLabel.textColor = .blue
        }
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            imageView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func loadImage() {
        if let url = URL(string: character.image) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
}
