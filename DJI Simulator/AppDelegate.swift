import UIKit
import WebKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SimulatorViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

final class SimulatorViewController: UIViewController {
    override func loadView() {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 196/255, green: 224/255, blue: 244/255, alpha: 1)
        webView.scrollView.isScrollEnabled = false
        view = webView
        if let page = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Web") {
            webView.loadFileURL(page, allowingReadAccessTo: page.deletingLastPathComponent())
        }
    }
    override var prefersStatusBarHidden: Bool { true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .all }
}
