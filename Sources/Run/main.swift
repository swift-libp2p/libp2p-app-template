import App
import LibP2P

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown(); app.logger.notice("Shutdown complete 👋") }
try configure(app)
try app.run()
