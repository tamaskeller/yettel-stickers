import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ZStack() {
            Color.Yettel.lime.ignoresSafeArea()
            VStack {
                Images.successDrops
                    .ignoresSafeArea()
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Texts.Success.message
                        .font(.Yettel.regular(size: 40))
                        .foregroundStyle(Color.Yettel.primaryBlue)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Images.successDude
                }
                RoundedButton {
                    Texts.Global.buttonOk
                } action: {
                    coordinator.reset()
                }
            }.padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    SuccessView()
}
