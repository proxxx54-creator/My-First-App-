//
//  ViewController.swift
//  My First App
//
//  Created by Artem  on 10.11.2026.
//

import UIKit

class ViewController: UIViewController {
        
        
        private var backgroundImageView = UIImageView()
        private var titleLabel = UILabel()
        private var nameLabel = UILabel()
        private var nameTextField = UITextField()
        private var albumLabel = UILabel()
        private var albumTextField = UITextField()
        private var historyTextView = UITextView()
        private var button = UIButton()
        
       
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupBackgroundImage()
            setupBackgroundImageConstraints()
            
            setupTitleLabel()
            setupTitleLabelConstraint()
            
            setupNameLabel()
            setupNameLabelConstraints()
            
            setupNameTextField()
            setupNameTextFieldConstraints()
            
            setupAlbumLabel()
            setupAlbumLabelConstraints()
            
            setupAlbumTextField()
            setupAlbumTextFieldConstraints()
            
            setupHistoryTextView()
            setupHistoryTextViewConstraints()
            
            setupSaveButton()
            setupSaveButtonConstraint()
            
           
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
            
            
            loadHistory()
        }
        
       
        private func setupBackgroundImage() {
            view.addSubview(backgroundImageView)
            backgroundImageView.image = UIImage(named: "my9albums")
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.clipsToBounds = true
        }
        
        private func setupBackgroundImageConstraints() {
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
        
        private func setupTitleLabel() {
            view.addSubview(titleLabel)
            titleLabel.text = "My Favorite Song"
            titleLabel.textColor = .white
            titleLabel.textAlignment = .left
            titleLabel.font = .systemFont(ofSize: 32, weight: .heavy)
            titleLabel.shadowColor = UIColor.black
            titleLabel.shadowOffset = CGSize(width: 2, height: 2)
        }
        
        private func setupTitleLabelConstraint() {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        private func setupNameLabel() {
            view.addSubview(nameLabel)
            nameLabel.text = "Любимая группа:"
            nameLabel.textColor = .white
            nameLabel.font = .systemFont(ofSize: 25, weight: .heavy)
            nameLabel.shadowColor = UIColor.black
            nameLabel.shadowOffset = CGSize(width: 2, height: 2)
        }
        
        private func setupNameLabelConstraints() {
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
                nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        private func setupNameTextField() {
            view.addSubview(nameTextField)
            nameTextField.backgroundColor = .darkGray
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white.withAlphaComponent(1.5) // Цвет и прозрачность (0.5 - полупрозрачный)
            ]

            nameTextField.attributedPlaceholder = NSAttributedString(string: "Название группы", attributes: attributes)
            //nameTextField.placeholder = "Название группы"
            nameTextField.borderStyle = .roundedRect
            nameTextField.font = .systemFont(ofSize: 19)
            nameTextField.textColor = .systemPurple
            nameTextField.layer.cornerRadius = 16
        }
        
        private func setupNameTextFieldConstraints() {
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
                nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        private func setupAlbumLabel() {
            view.addSubview(albumLabel)
            albumLabel.text = "Любимый альбом:"
            albumLabel.textColor = .white
            albumLabel.font = .systemFont(ofSize: 25, weight: .heavy)
            albumLabel.shadowColor = UIColor.black
            albumLabel.shadowOffset = CGSize(width: 2, height: 2)
        }
        
        private func setupAlbumLabelConstraints() {
            albumLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                albumLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
                albumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                albumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        private func setupAlbumTextField() {
            view.addSubview(albumTextField)
            albumTextField.backgroundColor = .white
            albumTextField.placeholder = "Название альбома"
            albumTextField.borderStyle = .roundedRect
            albumTextField.font = .systemFont(ofSize: 18)
            albumTextField.textColor = .black
            albumTextField.layer.cornerRadius = 16
        }
        
        private func setupAlbumTextFieldConstraints() {
            albumTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                albumTextField.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 16),
                albumTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                albumTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        private func setupHistoryTextView() {
            view.addSubview(historyTextView)
            historyTextView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            historyTextView.textColor = .white
            historyTextView.isEditable = false
            historyTextView.isScrollEnabled = true
            historyTextView.layer.cornerRadius = 12
            historyTextView.font = .monospacedSystemFont(ofSize: 14, weight: .regular)
            historyTextView.text = "История пуста"
        }
        
        private func setupHistoryTextViewConstraints() {
            historyTextView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            
                historyTextView.topAnchor.constraint(equalTo: albumTextField.bottomAnchor, constant: 60),
                historyTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                historyTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                historyTextView.heightAnchor.constraint(equalToConstant: 120)
            ])
        }
        
        private func setupSaveButton() {
            view.addSubview(button)
            button.setTitle("Save", for: .normal)
            button.backgroundColor = .purple
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
            button.layer.cornerRadius = 16
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        private func setupSaveButtonConstraint() {
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        
        @objc private func buttonPressed() {
            let band = nameTextField.text?.trimmingCharacters(in: .whitespaces) ?? "Неизвестная группа"
            let album = albumTextField.text?.trimmingCharacters(in: .whitespaces) ?? "Неизвестный альбом"
            
            let newEntry = "\(band) — \(album)"
            let defaults = UserDefaults.standard
            var history = defaults.stringArray(forKey: "myMusicHistory") ?? []
            
            history.append(newEntry)
            defaults.set(history, forKey: "myMusicHistory")
            
         
            historyTextView.text = history.joined(separator: "\n")
            
           
            nameTextField.text = ""
            albumTextField.text = ""
            
           
            view.endEditing(true)
        }
        
        @objc private func hideKeyboard() {
            view.endEditing(true)
        }
        
        private func loadHistory() {
            let defaults = UserDefaults.standard
            if let history = defaults.stringArray(forKey: "myMusicHistory"), !history.isEmpty {
                historyTextView.text = history.joined(separator: "\n")
            }
        }
    }



