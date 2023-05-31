//
//  TabViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
  
  // MARK: - Properties
  private var viewControllers: [UIViewController] = []
  @IBOutlet weak var tabView: UIView!
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabMan()
    isScrollEnabled = false
        
  }
  
  // MARK: - Methods
  func setTabMan() {
    guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "firstTabVC")
            as? FirstTabViewController else { return }
    guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondTabVC")
            as? SecondTabViewController else { return }
    guard let thridVC = storyboard?.instantiateViewController(withIdentifier: "thirdTabVC")
            as? ThirdTabViewController else { return }
    viewControllers.append(firstVC)
    viewControllers.append(secondVC)
    viewControllers.append(thridVC)
    
    self.dataSource = self
    let bar = TMBar.ButtonBar()
    
    bar.backgroundView.style = .blur(style: .light)
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    bar.layout.contentMode = .fit
    bar.buttons.customize { button in
      button.tintColor = .systemGray4
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    bar.indicator.weight = .custom(value: 3)
    bar.indicator.tintColor = .black
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 1, right: 50)
    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
  }
}

// MARK: - PageboyViewControllerDataSource, TMBarDataSource
extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    switch index {
    case 0:
      return TMBarItem(title: "메인")
    case 1:
      return TMBarItem(title: "영화관위치")
    case 2:
      return TMBarItem(title: "영화검색")
    case 3:
        return TMBarItem(title: "마이메뉴")
    case 4:
        return TMBarItem(title: "할인혜택")
    default:
      return TMBarItem(title: "page \(index)")
    }
  }
}
