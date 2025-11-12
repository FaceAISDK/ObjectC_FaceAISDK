// SwiftUIWrapper.swift
import SwiftUI
import UIKit

@objc public class SwiftUINavigator: NSObject {
    
    @objc public static let shared = SwiftUINavigator()
    
    private override init() {}
    
    // 方法1: 跳转到简单的 SwiftUI 页面
    @objc public func presentSimpleSwiftUI(from viewController: UIViewController) {
        let swiftUIView = FaceAINaviView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        hostingController.modalPresentationStyle = .fullScreen
        viewController.present(hostingController, animated: true)
    }
    
//    // 方法2: 跳转到带参数的 SwiftUI 页面
//    @objc public func presentSwiftUIWithMessage(_ message: String, from viewController: UIViewController) {
//        let swiftUIView = FaceAINaviView(message: message) {
//            // 回调处理
//            print("SwiftUI 页面关闭了")
//        }
//        let hostingController = UIHostingController(rootView: swiftUIView)
//        
//        hostingController.modalPresentationStyle = .pageSheet
//        if let sheet = hostingController.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.prefersGrabberVisible = true
//        }
//        
//        viewController.present(hostingController, animated: true)
//    }
//    
//    // 方法3: 推入导航栈
//    @objc public func pushSwiftUI(from navigationController: UINavigationController) {
//        let swiftUIView = FaceAINaviView(message: "从导航栈推入")
//        let hostingController = UIHostingController(rootView: swiftUIView)
//        
//        navigationController.pushViewController(hostingController, animated: true)
//    }
    
    // 方法4: 获取 UIViewController 实例
//    @objc public func createSwiftUIViewController(with message: String) -> UIViewController {
//        let swiftUIView = FaceAINaviView(message: message)
//        return UIHostingController(rootView: swiftUIView)
//    }
}
