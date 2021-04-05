import UIKit

class ViewController: UIViewController {

    private let contentView = SimulationView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
