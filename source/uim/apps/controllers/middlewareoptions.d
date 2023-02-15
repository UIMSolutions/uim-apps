module uim.apps.controllers.middlewareoptions;

@safe:
import uim.apps;

class DControllerMiddlewareOptions {
    // The middleware options.
    protected STRINGAA _options;

    // Create a new middleware option instance.
    this(STRINGAA options) {
        _options = options; }

    // Set the controller methods the middleware should apply to.
    O only(this O)(STRINGAA methods) {
        _options["only"] = methods;
        return cast(O)this; }

    // Set the controller methods the middleware should exclude.
    O except(this O)(STRINGAA methods) {
        _options["except"] = methods;
        return cast(O)this; }
}