import UIKit

public final class Label: UILabel {

    // MARK: - Initializers

    public init(textStyle: UIFont.TextStyle,
                textColor: UIColor,
                numberOfLines: Int = 0,
                textAlignment: NSTextAlignment = .center) {

        super.init(frame: .zero)

        self.font = .preferredFont(forTextStyle: textStyle)
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
