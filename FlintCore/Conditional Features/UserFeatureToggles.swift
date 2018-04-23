//
//  UserFeatureToggles.swift
//  FlintCore
//
//  Created by Marc Palmer on 13/01/2018.
//  Copyright © 2018 Montana Floss Co. Ltd. All rights reserved.
//

import Foundation

/// The interface to user-specified feature toggling, where a user may choose to switch certain features
/// on or off in the "Settings" of your app.
///
/// The `DefaultAvailabilityChecker` uses instances of this type to verify availability of user toggled features
/// at runtime. The default implementation `UserDefaultsFeatureToggles` stores the toggled values in User Defaults.
///
/// If you want to store your feature toggles differently, implement this protocol and assign your own
/// instance of `DefaultAvailabilityChecker` to `Flint.availabilityChecker` at startup.
public protocol UserFeatureToggles {
    /// Must return whether or not the feature should currently be enabled for the user.
    func isEnabled(_ feature: ConditionalFeatureDefinition.Type) -> Bool
    
    /// Must set the enabled status of the feature for the current user, and persist this.
    func setEnabled(_ feature: ConditionalFeatureDefinition.Type, enabled: Bool)
}
