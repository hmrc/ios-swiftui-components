/*
 * Copyright 2021 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI
import SUIComponents

open class SnapshotViewModel: ObservableObject {
    static var captureFolderName: String {
        if #available(iOS 13.0, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return "capture_dark_mode"
            } else {
                return "capture_light_mode"
            }
        } else {
            return "capture"
        }
    }
    @Published var size: CGSize = .zero 
}
public protocol ScreenshotableView: View {
    var snapshotViewModel: SnapshotViewModel { get set }
}
public extension ScreenshotableView {
    func snapshot() -> UIImage {
        let screenBounds = UIScreen.main.bounds
        let window = UIWindow(frame: screenBounds)
        let controller = UIHostingController(rootView: self)
        let view = controller.view!
        view.clipsToBounds = false
        window.rootViewController = controller
        window.makeKeyAndVisible()
        view.setNeedsLayout()
        view.layoutIfNeeded()
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.1))
        var size = snapshotViewModel.size
        size.height += 150
        size.height = size.height < screenBounds.height ? screenBounds.height : size.height
        size.width = screenBounds.width
        window.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
        view.backgroundColor = .clear
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        
        return renderer.image { context in
            view.layer.render(in: context.cgContext)
        }
    }
    
    func snapshotAndSave(_ filename: String) {
        let filename = filename.lowercased().contains(".png") ? filename : filename + ".png"
        let filepath = filePathFor(filename).path

        let image = snapshot()
        guard
            let srcroot = ProcessInfo.processInfo.environment["SRCROOT"],
            let srcrootFolder = try? Folder(path: "\(srcroot)"),
            let artifactsFolder = try? srcrootFolder.createSubfolderIfNeeded(withName: "Artifacts"),
            let captureFolder = try? artifactsFolder.createSubfolderIfNeeded(withName: SnapshotViewModel.captureFolderName),
            let screensFolder = try? captureFolder.createSubfolderIfNeeded(withName: "screens") else { return }

        if let file = try? screensFolder.file(named: URL(fileURLWithPath: filepath).lastPathComponent) {
            do {
                try file.delete()
            } catch {
                return
            }
        }

        do {
            let outputPath = URL(fileURLWithPath: screensFolder .path).appendingPathComponent(filename)
            print("Path is \(outputPath.path)")
            try image.pngData()?.write(to: outputPath)
        } catch {
            print(error)
            return
        }
    }

    func filePathFor(_ filename: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent(filename)
    }
    
}
