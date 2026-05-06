import SwiftUI

enum Texts {
    enum Global {
        static let buttonOk = Text("button_ok")
        static let buttonContinue = Text("button_continue")
        static let buttonCancel = Text("button_cancel")
        static let buttonPurchase = Text("button_purchase")
        static let totalPrice = Text("label_total_price")
    }

    enum Home {
        static let title = Text("title_home")
    }

    enum Counties {
        static let title = Text("title_counties")
    }

    enum Confirmation {
        static let title = Text("title_confirmation")
    }

    enum Success {
        static let message = Text("message_success")
    }

    enum Raw {
        static let plateNumber = NSLocalizedString("label_plate_number", comment: "")
        static let transactionFee = NSLocalizedString("label_transaction_fee", comment: "")
        static let vignetteType = NSLocalizedString("label_vignette_type", comment: "")
        static let vignetteDay = NSLocalizedString("label_vignette_day", comment: "")
        static let vignetteWeek = NSLocalizedString("label_vignette_week", comment: "")
        static let vignetteMonth = NSLocalizedString("label_vignette_month", comment: "")
        static let vignetteYear = NSLocalizedString("label_vignette_year", comment: "")
        static let vignetteCounty = NSLocalizedString("label_vignette_county", comment: "")
    }
}
