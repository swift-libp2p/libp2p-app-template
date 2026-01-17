import LibP2P
import LibP2PNoise
import LibP2PYAMUX

// configures your application
public func configure(_ app: Application) async throws {
    
    // We can specify the global log level here
    app.logger.logLevel = .notice

    // Configure your networking stack...
    app.security.use(.noise)
    app.muxers.use(.yamux)
    
    // Lets start a TCP server on the localhost bound to port 10000
    app.listen(.tcp(host: "127.0.0.1", port: 10000))
    
    // Add a custom command
    app.asyncCommands.use(Cowsay(), as: "cowsay")
    
    // register routes
    try routes(app)
    
    app.eventLoopGroup.next().scheduleTask(in: .milliseconds(100)) {
        for address in app.listenAddresses {
            let fullAddress = try address.encapsulate(proto: .p2p, address: app.peerID.b58String)
            app.logger.notice("Libp2p listening at \(fullAddress)")
        }
    }
}

/// An example of a custom command you can add to your app
///
/// Execute the `cowsay` cmd by running
/// ```
/// swift run App cowsay "Mmooo" --eyes "👀" --tongue "👅"
/// ```
struct Cowsay: AsyncCommand {
    struct Signature: CommandSignature {
        @Argument(name: "message")
        var message: String

        @Option(name: "eyes", short: "e")
        var eyes: String?

        @Option(name: "tongue", short: "t")
        var tongue: String?
    }

    var help: String {
        "Generates ASCII picture of a cow with a message."
    }

    func run(using context: CommandContext, signature: Signature) async throws {
        let eyes = signature.eyes ?? "oo"
        let tongue = signature.tongue ?? "  "
        let cow = #"""
          < $M >
                  \   ^__^
                   \  ($E)\_______
                      (__)\       )\/\
                       $T ||----w |
                          ||     ||
        """#.replacingOccurrences(of: "$M", with: signature.message)
            .replacingOccurrences(of: "$E", with: eyes)
            .replacingOccurrences(of: "$T", with: tongue)
        context.console.print(cow)
    }
}
