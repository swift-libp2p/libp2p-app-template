import LibP2P
import LibP2PNoise
import LibP2PMPLEX

// configures your application
public func configure(_ app: Application) throws {
    
    // We can specify the global log level here
    app.logger.logLevel = .notice

    // Configure your networking stack...
    app.security.use(.noise)
    app.muxers.use(.mplex)
    
    // Lets start a TCP server on the localhost bound to port 10000
    app.listen(.tcp(host: "127.0.0.1", port: 10000))
    
    // register routes
    try routes(app)
    
    app.eventLoopGroup.next().scheduleTask(in: .milliseconds(100)) {
        app.logger.notice("Libp2p listening at \(app.listenAddresses.first!)/p2p/\(app.peerID.b58String).")
    }
}
