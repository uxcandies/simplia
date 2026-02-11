import SwiftUI

struct OnboardingScreen: View {
    @State private var selectedInjuries: Set<String> = []
    @State private var otherInjury: String = ""

    private let injuries = [
        "Shoulder injury",
        "Knee injury",
        "Lower Back injury",
        "Ankle injury",
        "Wrist/Elbow injury",
        "Hip injury"
    ]

    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("Let’s get started")
                    .font(.system(size: 56, weight: .bold))
                    .padding(.top, 34)

                HStack(spacing: 40) {
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 18, height: 18)
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 18, height: 18)
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 18, height: 18)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 42)

                Text("Have you experienced\nany injury in the past?")
                    .font(.system(size: 52, weight: .bold))
                    .padding(.top, 44)

                VStack(alignment: .leading, spacing: 34) {
                    ForEach(injuries, id: \.self) { injury in
                        injuryOptionRow(title: injury)
                    }
                }
                .padding(.top, 58)

                HStack(spacing: 14) {
                    Text("Other:")
                        .foregroundStyle(Color(.systemGray3))
                        .font(.system(size: 25, weight: .medium))

                    TextField("", text: $otherInjury)
                        .font(.system(size: 24, weight: .regular))
                        .overlay(
                            Rectangle()
                                .fill(Color(.systemGray3))
                                .frame(height: 2),
                            alignment: .bottom
                        )
                }
                .padding(.horizontal, 44)
                .padding(.vertical, 24)
                .background(Color(.systemGray5))
                .clipShape(Capsule())
                .padding(.top, 56)

                HStack(spacing: 34) {
                    Button {
                        // Handle back action
                    } label: {
                        Text("Back")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 22)
                            .font(.system(size: 45, weight: .regular))
                    }
                    .buttonStyle(.plain)
                    .background(Color(.systemGray5))
                    .foregroundStyle(Color(.systemGray))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    Button {
                        // Handle next action
                    } label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 22)
                            .font(.system(size: 45, weight: .regular))
                    }
                    .buttonStyle(.plain)
                    .background(Color(.systemGray))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.top, 44)

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 52)
        }
    }

    @ViewBuilder
    private func injuryOptionRow(title: String) -> some View {
        Button {
            if selectedInjuries.contains(title) {
                selectedInjuries.remove(title)
            } else {
                selectedInjuries.insert(title)
            }
        } label: {
            HStack(spacing: 22) {
                Circle()
                    .stroke(Color(.systemGray3), lineWidth: 2)
                    .background(
                        Circle()
                            .fill(selectedInjuries.contains(title) ? Color(.systemGray2) : .clear)
                    )
                    .frame(width: 58, height: 58)

                Text(title)
                    .font(.system(size: 52, weight: .regular))
                    .foregroundStyle(Color(.systemGray))

                Spacer(minLength: 0)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    OnboardingScreen()
}
