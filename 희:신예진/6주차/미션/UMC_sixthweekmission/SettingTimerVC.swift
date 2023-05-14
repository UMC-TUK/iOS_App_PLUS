//
//  SettingTimerVC.swift
//  UMC_sixthweekmission
//
//  Created by 신예진 on 2023/05/13.
//

//import Foundation
//import UIKit
//
//class SettingTimerVC: UIViewController {
//    
//    private let repeatingSecondsTimer: RepeatingSecondsTimer
//    
//    private lazy var countDownDatePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .countDownTimer
//        return picker
//    }()
//    
//    private lazy var confirmButton: UIButton = {
//        // [커스텀 버튼 생성 실시]
//        let button = UIButton(
//    
//                )
//
//        button.backgroundColor = .white // 배경 색상 지정
//        button.setTitle("", for: .normal) // 타이틀 지정
//        button.setImage(UIImage(named: "startbtn.jpg")! as UIImage, for: .normal) // 버튼 이미지
//        
//        
//        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    private lazy var cancelButton: UIButton = {
//              // [커스텀 버튼 생성 실시]
//        // [커스텀 버튼 생성 실시]
//        let button = UIButton(
//                ) // 마진 및 사이즈 지정
//
//        button.backgroundColor = .white // 배경 색상 지정
//        button.setTitle("", for: .normal) // 타이틀 지정
//        button.setImage(UIImage(named: "cancelbtn.jpg")! as UIImage, for: .normal) // 버튼 이미지
//        
//        
////        button.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupViews()
//        addSubviews()
//        setupLayout()
//    }
//    
//    private func setupViews() {
//        view.backgroundColor = .systemBackground
//    }
//    
//    private func addSubviews() {
//        view.addSubview(countDownDatePicker)
//        view.addSubview(confirmButton)
//        view.addSubview(cancelButton)
//    }
//    
//    private func setupLayout() {
//        countDownDatePicker.translatesAutoresizingMaskIntoConstraints = false
//        countDownDatePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        countDownDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        
//        confirmButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            confirmButton.widthAnchor.constraint(equalToConstant: 70),
//            confirmButton.heightAnchor.constraint(equalToConstant: 70)
//        
//        ])
//
//        cancelButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            cancelButton.widthAnchor.constraint(equalToConstant: 70),
//            cancelButton.heightAnchor.constraint(equalToConstant: 70)
//            
//        
//        
//        
//        ])
//        
//
//        
//        
//        
//    }
//    
//    init(repeatingSecondsTimer: RepeatingSecondsTimer) {
//        self.repeatingSecondsTimer = repeatingSecondsTimer
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    @objc private func didTapConfirmButton() {
//        startTimer()
//        
//        let circularTimerVC = CircularTimerVC(startDate: Date(), countDownDurationSeconds: countDownDatePicker.countDownDuration)
//        navigationController?.pushViewController(circularTimerVC, animated: true)
//    }
//    
//    private func startTimer() {
//        repeatingSecondsTimer.start(durationSeconds: countDownDatePicker.countDownDuration, repeatingExecution: nil) {
//            print("완료")
//        }
//    }
//}
