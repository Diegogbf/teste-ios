import UIKit

class SimulationViewController: UIViewController {

    private let contentView = SimulationView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
