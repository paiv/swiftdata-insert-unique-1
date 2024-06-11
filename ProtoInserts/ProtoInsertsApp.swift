import SwiftData
import SwiftUI


@main
struct ProtoInsertsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(try! ModelContainer(
                    for: M.self,
                    configurations: ModelConfiguration(cloudKitDatabase: .none)
                ))
        }
    }
}
