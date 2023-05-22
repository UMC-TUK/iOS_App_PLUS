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
               
            } else {
                //카톡 설치가 안되어 있는 경우
                isLoggedIn = await kakaoLoginwithAccount()
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
