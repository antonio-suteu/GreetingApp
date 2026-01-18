import SwiftUI

struct LanguagePickerView: View {
    @Binding var language: String

    var body: some View {
        Menu {
            ForEach(Language.allCases, id: \.self) { lang in
                Button {
                    language = lang.rawValue
                } label: {
                    Text("\(lang.flag) \(lang.displayName)")
                }
            }
        } label: {
            Image(systemName: "gearshape.fill")
        }
    }
}

#Preview {
    LanguagePickerView(language: .constant("en"))
}
