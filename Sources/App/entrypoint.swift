import LibP2P
import Logging
import NIOCore
import NIOPosix

@main
enum Entrypoint {
    static func main() async throws {
        // Determine the environment based on the executable being ran (testing, development or production)
        var env = try Environment.detect()

        // Set up our logger
        try LoggingSystem.bootstrap(from: &env)

        // Create a persistent PeerID
        let peerID: KeyPairFile = .persistent(
            // Specify the PeerIDs key type (RSA, Secp256k1 or Ed25519)
            type: .Ed25519,
            // The password used to encrypt our PeerID on disk should be stored in the appropriate .env file in our projects root directory
            encryptedWith: .envKey,
            // The encrypted keys will be stored in the following directory within our projects root dir
            storedAt: .filePath(.init(filePath: ".keys"))
        )

        // Instantiate our libp2p app
        let app = try await Application.make(env, peerID: peerID)

        // This attempts to install NIO as the Swift Concurrency global executor.
        // You can enable it if you'd like to reduce the amount of context switching between NIO and Swift Concurrency.
        // Note: this has caused issues with some libraries that use `.wait()` and cleanly shutting down.
        // If enabled, you should be careful about calling async functions before this point as it can cause assertion failures.
        // let executorTakeoverSuccess = NIOSingletons.unsafeTryInstallSingletonPosixEventLoopGroupAsConcurrencyGlobalExecutor()
        // app.logger.debug("Tried to install SwiftNIO's EventLoopGroup as Swift's global concurrency executor", metadata: ["success": .stringConvertible(executorTakeoverSuccess)])

        do {
            try await configure(app)
            try await app.execute()
        } catch {
            app.logger.error("\(error)")
            try? await app.asyncShutdown()
            throw error
        }
        try await app.asyncShutdown()
    }
}
