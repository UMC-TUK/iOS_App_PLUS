//
//  KakaoAuthVM.swift
//  Week07_2
//
//  Created by 우주대스타 on 2023-05-23.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser
import UIKit

class KakaoAuthVM: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoggedIn : Bool = false
    
    lazy var loginStatusInfo : AnyPublisher<String?, Never> = $isLoggedIn.compactMap {
        $0 ? "로그인 상태" : "로그아웃 상태"
    }.eraseToAnyPublisher()
    
    init(){
        print("KakaoAuthVM - init() called")
    }
    
    func kakaoLoginWithApp() async -> Bool{
        
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:  false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    //do something
                    _ = oauthToken
                    continuation.resume(returning:  true)
                }
            }
        }
    }
    
    func kakaoLoginwithAccount() async -> Bool{
        await withCheckedContinuation{ continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:  false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
//                    self.getUserInfo()
                    //do something
                    _ = oauthToken
                    continuation.resume(returning:  true)
                }
            }
        }
    }
    
    @MainActor
    func KakaoLogin(){
        print("KakaoAuthVM - handleKakaoLogin() called")
        
        Task{
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await kakaoLoginWithApp()
                print("::")
                print(isLoggedIn)
            } else {
                //카톡 설치가 안되어 있는 경우
                isLoggedIn = await kakaoLoginwithAccount()
                print("::")
                print(isLoggedIn)
            }
        }
    }
    
    @MainActor
    func kakaoLogout(){
        Task{
            if await handleKakaoLogout() {
                self.isLoggedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation{ continuation in
            UserApi.shared.logout{(error) in
                if let error = error {
                    print (error)
                    continuation.resume(returning: false)
                }
                else{
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
}

//extension KakaoAuthVM {
//
//// ✅ 사용자 정보를 성공적으로 가져오면 화면전환 한다.
//    private func getUserInfo() {
//
//        // ✅ 사용자 정보 가져오기
//        UserApi.shared.me() {(user, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("me() success.")
//
//                // ✅ 닉네임, 이메일 정보
//                let nickname = user?.kakaoAccount?.profile?.nickname
//                let email = user?.kakaoAccount?.email
//
//                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
//
//                // ✅ 사용자 정보 넘기기
//                nextVC.nickname = nickname
//                nextVC.email = email
//
//                // ✅ 화면전환
//                self.navigationController?.pushViewController(nextVC, animated: true)
//            }
//        }
//    }
//}
