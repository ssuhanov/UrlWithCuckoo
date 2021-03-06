// MARK: - Mocks generated from file: UrlWithCuckoo/UrlSessionProtocol.swift at 2017-03-28 08:13:17 +0000

//
//  UrlSessionProtocol.swift
//  UrlWithCuckoo
//
//  Created by Serge Sukhanov on 3/28/17.
//  Copyright © 2017 Serge Sukhanov. All rights reserved.
//

import Cuckoo
@testable import UrlWithCuckoo

import Foundation

class MockUrlSessionProtocol: UrlSessionProtocol, Cuckoo.Mock {
    typealias MocksType = UrlSessionProtocol
    typealias Stubbing = __StubbingProxy_UrlSessionProtocol
    typealias Verification = __VerificationProxy_UrlSessionProtocol
    let manager = Cuckoo.MockManager()
    
    private var observed: UrlSessionProtocol?
    
    func spy(on victim: UrlSessionProtocol) -> Self {
        observed = victim
        return self
    }
    
    var url: URL? {
        get {
            return manager.getter("url", original: observed.map { o in return { () -> URL? in o.url } })
        }
        set {
            manager.setter("url", value: newValue, original: observed != nil ? { self.observed?.url = $0 } : nil)
        }
    }
    
    var session: URLSession? {
        get {
            return manager.getter("session", original: observed.map { o in return { () -> URLSession? in o.session } })
        }
        set {
            manager.setter("session", value: newValue, original: observed != nil ? { self.observed?.session = $0 } : nil)
        }
    }
    
    var apiUrl: String? {
        get {
            return manager.getter("apiUrl", original: observed.map { o in return { () -> String? in o.apiUrl } })
        }
        set {
            manager.setter("apiUrl", value: newValue, original: observed != nil ? { self.observed?.apiUrl = $0 } : nil)
        }
    }
    
    func getSourceUrl(apiUrl: String) -> URL {
        return manager.call("getSourceUrl(apiUrl: String) -> URL", parameters: (apiUrl), original: observed.map { o in return { (apiUrl: String) -> URL in o.getSourceUrl(apiUrl: apiUrl) } })
    }
    
    func callApi(url: URL) -> String {
        return manager.call("callApi(url: URL) -> String", parameters: (url), original: observed.map { o in return { (url: URL) -> String in o.callApi(url: url) } })
    }
    
    struct __StubbingProxy_UrlSessionProtocol: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var url: Cuckoo.ToBeStubbedProperty<URL?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "url")
        }
        
        var session: Cuckoo.ToBeStubbedProperty<URLSession?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "session")
        }
        
        var apiUrl: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "apiUrl")
        }
        
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.StubFunction<(String), URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getSourceUrl(apiUrl: String) -> URL", parameterMatchers: matchers))
        }
        
        func callApi<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.StubFunction<(URL), String> where M1.MatchedType == URL {
            let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("callApi(url: URL) -> String", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_UrlSessionProtocol: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var url: Cuckoo.VerifyProperty<URL?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "url", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var session: Cuckoo.VerifyProperty<URLSession?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "session", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var apiUrl: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "apiUrl", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getSourceUrl<M1: Cuckoo.Matchable>(apiUrl: M1) -> Cuckoo.__DoNotUse<URL> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: apiUrl) { $0 }]
            return manager.verify("getSourceUrl(apiUrl: String) -> URL", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func callApi<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.__DoNotUse<String> where M1.MatchedType == URL {
            let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
            return manager.verify("callApi(url: URL) -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class UrlSessionProtocolStub: UrlSessionProtocol {
    
    var url: URL? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URL?).self)
        }
        set {
        }
    }
    
    var session: URLSession? {
        get {
            return DefaultValueRegistry.defaultValue(for: (URLSession?).self)
        }
        set {
        }
    }
    
    var apiUrl: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        set {
        }
    }
    
    func getSourceUrl(apiUrl: String) -> URL {
        return DefaultValueRegistry.defaultValue(for: (URL).self)
    }
    
    func callApi(url: URL) -> String {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
}
