//
//  CircularTimerVC.swift
//  UMC_sixthweekmission
//
//  Created by 신예진 on 2023/05/13.
//

//import Foundation
//import UIKit
//
//class CircularTimerVC: UIViewController {
//
//    private let countDownDurationSeconds: TimeInterval
//    private let startDate: Date
//
//    private lazy var circularTimerView: CircularTimerView = {
//        let progressColors = ProgressColors(trackLayerStrokeColor: UIColor.lightGray.cgColor,
//                                            barLayerStrokeColor: UIColor.orange.cgColor)
//        let view = CircularTimerView(progressColors: progressColors,
//                                     duration: countDownDurationSeconds,
//                                     startDate: startDate)
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupViews()
//        addSubviews()
//        makeConstraints()
//    }
//
//    init(startDate: Date, countDownDurationSeconds: TimeInterval) {
//        self.startDate = startDate
//        self.countDownDurationSeconds = countDownDurationSeconds
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//
//    private func setupViews() {
//        view.backgroundColor = .systemBackground
//    }
//
//    private func addSubviews() {
//        view.addSubview(circularTimerView)
//    }
//
//    private func makeConstraints() {
//        circularTimerView.translatesAutoresizingMaskIntoConstraints = false
//        circularTimerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        circularTimerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//}
