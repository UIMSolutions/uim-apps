module uim.apps.commands.factory;

@safe:
import uim.apps;

class DCommandFactory {
    this() { initialize; }

    void initialize() {       
    }
    
    ICommand create(string name) {
        return null;
    }
}
auto CommandFactory() { return new DCommandFactory; }

version(test_uim_apps) { unittest {
    assert(CommandFactory);
}}