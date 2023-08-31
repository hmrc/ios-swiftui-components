# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [1.11.1] - 2023-08-31Z
- Fixed VoiceOver selection on `SelectRowView`
- Added bold link text to text styles

## [1.10.1] - 2023-08-18Z
- Added `isButton` trait to `CustomButton`

## [1.10.0] - 2023-08-15Z
- Added accessibilityLabel to `MultiColumnRowView`

## [1.9.0] - 2023-08-10Z
- Added bold error text

## [1.8.0] - 2023-07-25Z
- Made animation on `DonutChartView` toggleable and added height to `DonutLegendView` colour boxes

## [1.7.0] - 2023-07-05Z
- Added `.spacer0` and added view Id to disclosue view button

## [1.6.6] - 2023-06-27Z
- Make `IconButtonWithDisclosureView` model public to allow unit tests to trigger tap handler

## [1.6.5] - 2023-06-22Z
- Fixed `heading` accessibility trait for H3, H4 & H5

## [1.6.4] - 2023-06-19Z

- Modified `NotificationBubbleView` and `MenuPanelRowView` to group accessibility label

## [1.6.3] - 2023-06-15Z
- Modified `MenuPanelRowView` to correct theme and prevent text compression
- Added `ChevronRight` Assets to match resources in the main app.  

## [1.6.2] - 2023-06-12Z
- Modified `MenuPanelRowView` Organism into Hashable/Equatable type

## [1.6.1] - 2023-06-12Z

- Fixed issue with `donutLegendItem` repeating legend item keys if values are not unique

## [1.6.0] - 2023-06-08Z
- Added `MenuPanelRowView` Organism
- Added `NotificationBubbleView` Molecule

## [1.5.0] - 2023-05-18Z
- Added `IconButtonWithDisclosureView` molecule

## [1.4.2] - 2023-05-05Z
- Fixed issue with Dynamic Font not updating on the current screen when changed in settings

## [1.4.1] - 2023-04-26Z
- Exposed variables on `MiniAdvertCardView` so they can be accessed from UnitTests

## [1.4.0] - 2023-04-26Z
- Added `MiniAdvertCardView`

## [1.3.5] - 2023-04-21Z
- Added accessibilityLabels to `InformationMessageCard`

## [1.3.4] - 2023-04-19Z
- Added A new CTAHandler to the `InformationMessageCard` to allow ctas data to past back to the app handlers

## [1.3.3] - 2023-04-04Z
- Fixed issue with `EditableListView` not announcing the edit buttons becoming visible
- Added development certs/profiles & fastlane lanes to allow building to local device

## [1.3.2] - 2023-04-03Z
- Fixed Xcode 14.3 compiler issues

## [1.3.1] - 2023-03-28Z
- Fixed issue with `SecondaryButtonStyle` tap area being too small

## [1.3.0] - 2023-03-24Z
- Added `Text` Atom to handle attributed accessibility labels/hints in SwiftUI versions < iOS 15
- Added `AttributedText` Atom to handle `NSAttributedString` in SwiftUI versions < iOS 15
- Added `alignment: Alignment` parmeter to `SecondaryButtonStyle`
- Fixed `EditListView` layout in large text mode
- Fixed `IconButtonView` image height that was causing issues in large text mode

## [1.2.0] - 2023-03-02Z
- Removed conflicting animations from donut chart

## [1.1.0] - 2023-02-28Z
- Added Donut chart and legend

## [1.0.0] - 2023-02-28Z
- Version 1.0 of SUI Components

### Added
- Initial release!
