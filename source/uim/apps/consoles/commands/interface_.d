module uim.apps.consoles.commands.interface_;

@safe:
import uim.apps;

// Describe the interface between a command and the surrounding console libraries.
interface IAPPCommand {
    // Default error code
    static const int CODE_ERROR = 1;

    // Default success code
    static const int CODE_SUCCESS = 0;

    /**
     * Set the name this command uses in the collection.
     *
     * Generally invoked by the CommandCollection when the command is added.
     * Required to have at least one space in the name so that the root
     * command can be calculated.
     *
     * name = Name the command uses in the collection.
     */
    O name(this O)(string name);

    /**
     * Run the command.
     *
     * argv = Arguments from the CLI environment.
     * io = The console io
     * return = Exit code or null for success.
     */
    int run(STRINGAA arguments, DAPPConsoleIO io);
}
