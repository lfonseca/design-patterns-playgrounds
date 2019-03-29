protocol Cache {
    var next: Cache? {get}
    init(next: Cache?)
    func requestFile(named filename: String)
    func hasFile(named filename: String) -> Bool
    func getFile(named filename: String)
}

extension Cache {
    func requestFile(named filename: String) {
        if hasFile(named: filename) {
            getFile(named: filename)
        } else if let next = next {
            next.requestFile(named: filename)
        } else {
            print("This file does not exists :/")
        }
    }
}

class MemoryCache: Cache {
    var next: Cache?
    private var hasFile: Bool
    
    required init(next: Cache?) {
        self.next = next
        self.hasFile = false
    }
    
    convenience init(next: Cache? = nil, hasFile: Bool = false) {
        self.init(next: next)
        self.hasFile = hasFile
    }
    
    func getFile(named filename: String) {
        print("Found it! your file is in memory")
    }
    
    func hasFile(named filename: String) -> Bool {
        return hasFile
    }
}

class DiskCache: Cache {
    var next: Cache?
    private var hasFile: Bool
    
    required init(next: Cache?) {
        self.next = next
        self.hasFile = false
    }
    
    convenience init(next: Cache? = nil, hasFile: Bool = false) {
        self.init(next: next)
        self.hasFile = hasFile
    }
    
    func getFile(named filename: String) {
        print("Found it! your file is in disk")
    }
    
    func hasFile(named filename: String) -> Bool {
        return hasFile
    }
}

class CloudCache: Cache {
    var next: Cache?
    private var hasFile: Bool
    
    required init(next: Cache?) {
        self.next = next
        self.hasFile = false
    }
    
    convenience init(next: Cache? = nil, hasFile: Bool = false) {
        self.init(next: next)
        self.hasFile = hasFile
    }
    
    func getFile(named filename: String) {
        print("Found it! your file is in the cloud")
    }
    
    func hasFile(named filename: String) -> Bool {
        return hasFile
    }
}

var cache: Cache = CloudCache()
cache = DiskCache(next: cache, hasFile: true)
cache = MemoryCache(next: cache)

cache.requestFile(named: "file")
