import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ZStack() {
            Color.Yettel.lime.ignoresSafeArea()
            VStack {
                Assets.Images.successDrops
                    .ignoresSafeArea()
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Text("A matricákat\nsikeresen\nkifizetted!")
                        .font(.system(size: 40))
                        .foregroundStyle(Color.Yettel.primaryBlue)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Assets.Images.successDude
                }
                RoundedButton {
                    Text("Rendben")
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
