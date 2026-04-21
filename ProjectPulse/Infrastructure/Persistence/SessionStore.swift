import Foundation

enum SessionStore {
    private static var fileURL: URL {
        let support = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let veiraDir = support.appendingPathComponent("Veira", isDirectory: true)
        let veiraFile = veiraDir.appendingPathComponent("workdays.json")

        // One-time migration: copy data from the legacy ProjectPulse directory if
        // the Veira file doesn't exist yet. The original file is left in place.
        if !FileManager.default.fileExists(atPath: veiraFile.path) {
            let legacyFile = support
                .appendingPathComponent("ProjectPulse", isDirectory: true)
                .appendingPathComponent("workdays.json")
            if FileManager.default.fileExists(atPath: legacyFile.path) {
                try? FileManager.default.createDirectory(at: veiraDir, withIntermediateDirectories: true)
                try? FileManager.default.copyItem(at: legacyFile, to: veiraFile)
            }
        }

        try? FileManager.default.createDirectory(at: veiraDir, withIntermediateDirectories: true)
        return veiraFile
    }

    static func load() -> [WorkDayRecord] {
        let url = fileURL
        guard FileManager.default.fileExists(atPath: url.path) else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }

        do {
            return try JSONDecoder().decode([WorkDayRecord].self, from: data)
        } catch {
            print("[SessionStore] Failed to decode workdays.json. Returning an empty session list. Error: \(error)")
            return []
        }
    }

    static func save(_ workDays: [WorkDayRecord]) {
        guard let data = try? JSONEncoder().encode(workDays) else { return }
        try? data.write(to: fileURL, options: .atomic)
    }
}
