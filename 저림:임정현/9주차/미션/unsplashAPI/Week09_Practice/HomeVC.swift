//
//  ViewController.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import UIKit
import Alamofire

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}

enum API {
    static let BASE_URL : String = "https://api.unsplash.com/"
    static let CLIENT_ID : String = "AOH470YW4W9FFr6TKXYMu2Nhv-BjgiqmhOl8r2_tUcA"
}

class HomeVC: UIViewController {

    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeVC - viewDidLoad() called")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HomeVC - viewDidAppear() called")
        self.searchBar.becomeFirstResponder() // 포커싱 주기
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        print("HomeVC - prepared() called / segue.identifier : \(segue.identifier)")
        
        switch segue.identifier{
        case SEGUE_ID.USER_LIST_VC:
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue = self.searchBar.text else { return }
            nextVC.vcTitle = userInputValue
            
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            let nextVC = segue.destination as! PhotoCollectionVC
            guard let userInputValue = self.searchBar.text else { return }
            nextVC.vcTitle = userInputValue
            
        default:
            print("default")
        }
        
    }
    
    //MARK - fileprivate
    fileprivate func pushVC(){
        var segueId : String = ""
        
        switch searchFilterSegment.selectedSegmentIndex{
        case 0:
            print("사진 화면 이동")
            segueId = "goToPhotoCollectionVC"
        case 1:
            print("사용자 화면 이동")
            segueId = "goToUserListVC"
        default:
            print("default")
            segueId = "goToPhotoCollectionVC"
        }

        // 화면 이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    //MARK: - IBACtion methods
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("searchFilterValueChanged called")
        
        var searchBarTitle = ""
        
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드 입력"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        self.searchBar.becomeFirstResponder() // 포커싱
//        self.searchBar.resignFirstResponder() // 포커싱 해제
    }
    
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - onSearchButtonClicked() called / selectedIndex:  \(searchFilterSegment.selectedSegmentIndex)")
        // 화면 이동
        
//        let url = API.BASE_URL + "search/photos"
        
        guard let userInput = self.searchBar.text else { return }
//        let queryParam = ["query" : userInput, "client_id" : API.CLIENT_ID]
//        AF.request(url, method: .get, parameters: queryParam).responseJSON(completionHandler: {response in
//            debugPrint(response)
//        })
        var urlToCall : URLRequestConvertible?
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            urlToCall = MySearchRouter.searchPhotos(term: userInput)
            MyAlamofireManager.shared.getPhotos(searchTerm: userInput, completion: {
                result in
                switch result {
                case .success(let fetchedPhotos):
                    print("HomeVC - getPhotos.success - fetchedPhotos.count : \(fetchedPhotos)")
                case .failure(let error):
                    print("HomeVC - getPhotos.failure - error : \(error.rawValue)")
                }
            })
        case 1:
            urlToCall = MySearchRouter.searchUsers(term: userInput)
        default:
            print("default")
        }
        
//        if let urlConvertible = urlToCall {
//            MyAlamofireManager.shared.session.request(urlConvertible).validate(statusCode: 200..<401).responseJSON(completionHandler: {
//                response in
//                print("HomeVC - reponse: \(response)")
//                print("HomeVC - response.error : \(response.error)")
//    //            debugPrint(response)
//            })
//        }
//        pushVC()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        print("HomeVC - searchBarSearchButtonClicked()")
        
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            print("입력 된 값 없음")
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
    }

}

