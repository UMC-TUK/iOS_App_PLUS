//
//  ViewController.swift
//  UMC_sixthweekpractice
//
//  Created by 신예진 on 2023/05/10.
//

import UIKit

// MARK: Async, Await를 사용한 경우
class ViewController: UIViewController {
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("이미지 불러오기", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
      button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  private let imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(self.button)
    self.view.addSubview(self.imageView)
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.imageView.heightAnchor.constraint(equalToConstant: 120),
      self.imageView.widthAnchor.constraint(equalToConstant: 120),
      self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }

  @objc private func didTapButton() {
    guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }

    Task {
      guard
        let imageURL = try? await self.requestImageURL(requestURL: url),
        let url = URL(string: imageURL),
        let data = try? Data(contentsOf: url)
      else { return }
      print(Thread.isMainThread) // true
      self.imageView.image = UIImage(data: data)
    }
  }
  func requestImageURL(requestURL: URL) async throws -> String {
    print(Thread.isMainThread) // false
    let (data, _) = try await URLSession.shared.data(from: requestURL)
    return try JSONDecoder().decode(MyModel.self, from: data).data.first?.avatar ?? ""
  }
}
