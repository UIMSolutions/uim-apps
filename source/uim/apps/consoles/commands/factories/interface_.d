module uim.apps.consoles.commands.factories.interface_;

@safe:
import uim.apps;

// An interface for abstracting creation of command and shell instances.
interface IAPPCommandFactory {
    //The factory method for creating Command and Shell instances.
    IAPPCommand create(string className); // className = Command/Shell class name.
}
