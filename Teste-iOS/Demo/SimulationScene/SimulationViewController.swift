import UIKit

class SimulationViewController: UIViewController {

    // MARK: - Properties

    private let contentView = SimulationView()
    private var viewModel: SimulationViewModelProtocol

    override func loadView() {
        super.loadView()
        view = contentView
    }

    required init(viewModel: SimulationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setups

extension SimulationViewController {
    func setup() {
        viewModel.delegate = self
        setupButtons()
    }

    func setupButtons() {
        contentView.simulateButton.addTarget(self, action: #selector(simulateButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions

extension SimulationViewController {
    @objc private func simulateButtonTapped() {
        viewModel.simulateTapped(
            value: contentView.investedValueInput.text ?? "",
            date: contentView.expirationDateInput.text ?? "",
            rate: contentView.CDIRateInput.text ?? ""
        )
    }
}

// MARK: - Setups

extension SimulationViewController: SimulationViewModelFeedBack {
    func loader(show: Bool) {
        contentView.simulateButton.isLoading = show
    }
}
