module uim.apps.consoles.commands.factories.factory;

@safe:
import uim.apps;

// factory for creating Command and Shell instances.
// This factory can be replaced or extended if you need to customize building your command and shell objects.
class DAPPCommandFactory : IAPPCommandFactory {
    protected IMVCContainer _container;
    this(IMVCContainer newContainer = null) {
        _container = newContainer; }

    IAPPCommand create(string className) {
        IAPPCommand command;
/*         if (_container && _container.has(className)) {
            command = _container.get(className);
        } else {
            command = new $className();
        } */

        if (!cast(IAPPCommand)command) { // } && !cast(DAPPShell)command) {
/*             $valid = implode('` or `', [Shell::class, CommandInterface::class]);
            $message = sprintf('Class `%s` must be an instance of `%s`.', $className, $valid);
            throw new InvalidArgumentException($message);
 */        }

        return command;
    }
}
