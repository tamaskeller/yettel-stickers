import SwiftUI

struct CountyMap: View {

    let countyIdentifiers: [String]
    let selectedCountyIdentifiers: [String]

    var body: some View {
        ZStack {
            ForEach(countyIdentifiers, id: \.self) { identifier in
                Image("county-\(identifier)")
                    .resizable()
                    .foregroundColor(
                        selectedCountyIdentifiers.contains(identifier) ?
                            .Yettel.lime : .Yettel.backgroundBlue)
            }
        }
    }
}
