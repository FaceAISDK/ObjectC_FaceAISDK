import SwiftUI
import UIKit

/// ObjC bridge to present FaceAISDK SwiftUI views from Objective-C code.
@objc public class FaceAISDKBridge: NSObject {

    private static let faceID = "yourFaceID"

    // MARK: - 1. Add Face By Camera
    @objc public static func addFaceByCameraViewController() -> UIViewController {
        let view = AddFaceByCamera(
            faceID: faceID,
            addFacePerformanceMode: 1,
            needShowConfirmDialog: true,
            onDismiss: { result, feature in
                print("🎆 AddFace Status: \(result), Feature: \(feature)")
            }
        )
        return UIHostingController(rootView: view)
    }

    // MARK: - 2. Add Face From Album
    @objc public static func addFaceByImageViewController() -> UIViewController {
        let view = AddFaceByImage(
            faceID: faceID,
            onDismiss: { result, feature in
                print("🎆 AddFace Status: \(result), Feature: \(feature ?? "")")
            }
        )
        return UIHostingController(rootView: view)
    }

    // MARK: - 3. Face Verify & Liveness
    @objc public static func verifyFaceViewController() -> UIViewController {
        let view = VerifyFaceView(
            faceID: faceID,
            threshold: 0.83, // Threshold range [0.8, 0.9].  阈值范围【0.8，0.9】
            
            // 1. Motion Liveness, 2. Motion + Color, 3. Color, 4. Silent Liveness only (the first three all include silent liveness).
            // 1.动作活体 2.动作+炫彩 3.炫彩 4.仅静默活体(前三种都会带静默)。
            livenessType: 1,
            
            // 1. Open mouth, 2. Smile, 3. Blink, 4. Shake head, 5. Nod.
            // 1.张嘴 2.微笑 3.眨眼 4.摇头 5.点头。
            motionLiveness: "1,2,3,4,5",
            motionLivenessTimeOut: 9,
            motionLivenessSteps: 2,
            onDismiss: { code, similarity, liveness in
                print("🎆 Face Verify Status: \(code), Similarity: \(similarity), Liveness: \(liveness)")
            }
        )
        return UIHostingController(rootView: view)
    }

    // MARK: - 4. Liveness Detection Only
    @objc public static func livenessDetectViewController() -> UIViewController {
        let view = LivenessDetectView(
            livenessType: 2,
            motionLiveness: "1,2,3,4,5",
            motionLivenessTimeOut: 7,
            motionLivenessSteps: 2,
            showResultTips: false,
            onDismiss: { code, liveness in
                print("🎆 Liveness Result: \(code), Liveness Score: \(liveness)")
            }
        )
        return UIHostingController(rootView: view)
    }

    // MARK: - 5. Check Face Feature Exist
    @objc public static func isFaceFeatureExist() -> NSString? {
        guard let feature = UserDefaults.standard.string(forKey: faceID) else {
            print("isFaceFeatureExist？ ： No ! ")
            return nil
        }
        print("\n😊FaceFeature: \(feature)")
        return feature as NSString
    }

    // MARK: - 6. Verify Two Face Similarity
    @objc public static func verifyTwoFaceSimiViewController() -> UIViewController {
        let view = VerifyTwoFaceSimiView()
        return UIHostingController(rootView: view)
    }

    // MARK: - 7. Full Navigation View (original FaceAINaviView)
    @objc public static func faceAINaviViewController() -> UIViewController {
        let hostingController = UIHostingController(rootView: FaceAINaviView())
        hostingController.rootView = FaceAINaviView(onDismiss: { [weak hostingController] in
            hostingController?.dismiss(animated: true)
        })
        return hostingController
    }
}
