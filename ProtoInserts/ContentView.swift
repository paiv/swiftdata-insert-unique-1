import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [M]
    @State private var error: Error?
    
    var body: some View {
        List {
            Section {
                Button {
                    addItem()
                } label: {
                    Text("Add")
                }
            }
            Section {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.answer, format: .number)
                            Text(item.value)
                            Spacer()
                            Button {
                                setAnswer(item)
                            } label: {
                                Text("%")
                            }
                        }
                        Text(item.date, format: .iso8601)
                            .font(.caption)
                    }
                }
            } footer: {
                Text("total: \(items.count)")
            }
            Section {
                if let error {
                    Text(error.localizedDescription)
                }
            }
        }
    }
    
    func addItem() {
        let x = M(value: "x")
        modelContext.insert(x)
//        try! modelContext.save()
    }
    
    func setAnswer(_ item: M) {
        item.answer = 42
    }
}


@Model class M {
    @Attribute(.unique)
    var value: String
    var date: Date
    var answer: Int
    init(value: String, date: Date = .now, answer: Int = 0) {
        self.value = value
        self.date = date
        self.answer = answer
    }
}


#Preview {
    ContentView()
        .modelContainer(for: M.self, inMemory: true)
}
