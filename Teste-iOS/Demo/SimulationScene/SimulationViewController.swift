import UIKit

class SimulationViewController: CustomViewController<SimulationView> {

    // MARK: - Properties

    private var viewModel: SimulationViewModelProtocol

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
        viewModel.investmentAmount = contentView.investedValueInput.text
        viewModel.rate = contentView.CDIRateInput.text
        viewModel.expirationDate = contentView.expirationDateInput.text
        viewModel.simulateTapped()
    }
}

// MARK: - Setups

extension SimulationViewController: SimulationViewModelFeedBack {
    func displayError(message: String) {
        showErrorAlert(msg: message)
    }

    func loader(show: Bool) {
        contentView.simulateButton.isLoading = show
    }
}
