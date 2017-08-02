/******************************************************************************
 * Moj.io Inc. CONFIDENTIAL
 * 2017 Copyright Moj.io Inc.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains, the property of
 * Moj.io Inc. and its suppliers, if any.  The intellectual and technical
 * concepts contained herein are proprietary to Moj.io Inc. and its suppliers
 * and may be covered by Patents, pending patents, and are protected by trade
 * secret or copyright law.
 *
 * Dissemination of this information or reproduction of this material is strictly
 * forbidden unless prior written permission is obtained from Moj.io Inc.
 *******************************************************************************/

import UIKit

public protocol MojioRegionPrefix {
    var regionPrefix: String {get}
}

open class MojioRegion: MojioRegionPrefix {

    public enum RegionType: String {
        case production = ""
        case staging = "staging-"
        case trial = "trial-"
        case develop = "develop-"
        case load = "load-"
    }
    
    open private(set) var regionType: RegionType = .production
    
    public init() {
        self.regionType = self.defaultRegionType
    }
    
    public init(_ regionType: RegionType) {
        self.regionType = regionType
    }

    open var defaultRegionType: RegionType {
        return .production
    }
    
    open var regionPrefix: String {
        return ""
    }
    
    open var description: String {
        return self.regionPrefix + self.regionType.rawValue
    }
}

public enum IdentityEndpointType {
    case accounts
    case identity
}

public protocol IdentityEndpoint {
    var identityEndpointType: IdentityEndpointType {get}
}

public enum MojioEndpoint {
    case api
    case push
    case wsPush
    case myMojio
    case accounts
    case identity
}

open class ClientEnvironment: IdentityEndpoint {
    
    private static let endpointDomainFormats: [MojioEndpoint: String] = [
        .api: "%@api.moj.io",
        .push: "%@push.moj.io",
        .wsPush: "%@api.moj.io",
        .myMojio: "%@my.moj.io",
        .accounts: "%@accounts.moj.io",
        .identity: "%@identity.moj.io",
        ]
    
    open func domainFromMojioEndpoint(_ endpoint: MojioEndpoint) -> String {
        if let endpointFormat = ClientEnvironment.endpointDomainFormats[endpoint] {
            return String(
                format: endpointFormat,
                arguments: [self.region.description])
        }
        
        return ""
    }
    
    private enum EndPointFormat: String {
        case apiEndpoint = "https://%@api.moj.io/v2/"
        case apiV1Endpoint = "https://%@api.moj.io/v1/"
        case pushApnsEndpoint = "https://%@push.moj.io/v2/"
        case pushWSEndpoint = "wss://%@api.moj.io/v2/"
        case myMojioEndpoint = "https://%@my.moj.io/"
        case accountsEndpoint = "https://%@accounts.moj.io/"
        case identityEndpoint = "https://%@identity.moj.io/"
    }
    
    fileprivate var region: MojioRegion = MojioRegion()
    
    fileprivate var apiEndpoint: String?
    fileprivate var apiV1Endpoint: String?
    fileprivate var pushApnsEndpoint: String?
    fileprivate var pushWSEndpoint: String?
    fileprivate var myMojioEndpoint: String?
    fileprivate var accountsEndpoint: String?
    fileprivate var identityEndpoint: String?
    
    public init() {
        self.updateEndPoints()
    }
    
    open func getRegion() -> MojioRegion {
        return self.region
    }
    
    /**
        Letting an app developer ovveride the default environment. This should be used only for development purposes to test the functionality of the app in different continents
     */
    open func setRegion (_ region: MojioRegion) {
        self.region = region
        self.updateEndPoints()
    }
    
    private func updateEndPoints() {
        self.apiEndpoint = String(
            format: ClientEnvironment.EndPointFormat.apiEndpoint.rawValue,
            arguments: [self.region.description])
        
        self.apiV1Endpoint = String(
            format: ClientEnvironment.EndPointFormat.apiV1Endpoint.rawValue,
            arguments: [self.region.description])
        
        self.pushApnsEndpoint = String(
            format: ClientEnvironment.EndPointFormat.pushApnsEndpoint.rawValue,
            arguments: [self.region.description])
        
        self.pushWSEndpoint = String(
            format: ClientEnvironment.EndPointFormat.pushWSEndpoint.rawValue,
            arguments: [self.region.description])
        
        self.myMojioEndpoint = String(
            format: ClientEnvironment.EndPointFormat.myMojioEndpoint.rawValue,
            arguments: [self.region.description])
        
        self.accountsEndpoint = String(
            format: ClientEnvironment.EndPointFormat.accountsEndpoint.rawValue,
            arguments: [self.region.description])
        
        self.identityEndpoint = String(
            format: ClientEnvironment.EndPointFormat.identityEndpoint.rawValue,
            arguments: [self.region.description])
    }
    
    open func setDefaultRegion () {
        self.setRegion(MojioRegion())
    }
    
    open func getApiEndpoint () -> String {
        return self.apiEndpoint!
    }
    
    open func getV1ApiEndpoint () -> String {
        return self.apiV1Endpoint!
    }
    
    open func getPushApnsEndpoint () -> String {
        return self.pushApnsEndpoint!
    }
    
    open func getPushWSEndpoint () -> String {
        return self.pushWSEndpoint!
    }
    
    open func getMyMojioEndpoint () -> String {
        return self.myMojioEndpoint!
    }
    
    open func getAccountsEndpoint () -> String {
        if self.identityEndpointType == .identity {
            return self.identityEndpoint!
        }
        else {
            return self.accountsEndpoint!
        }
    }
    
    open var identityEndpointType: IdentityEndpointType {
        return .accounts
    }
}
