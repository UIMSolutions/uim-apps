module uim.apps.commands.interface_;

@safe:
import uim.apps;

interface ICommand { 
  // Set the name of this command 
  O setName(this O)(string name);

  // Run the command.
  int run(STRINGAA arguments);
}