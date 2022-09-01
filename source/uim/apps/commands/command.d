module uim.apps.commands.command;

@safe:
import uim.apps;

class DAPPCommand { // extends SymfonyCommand
    // Application instance
    mixin(OProperty!("DAPPApplication",  "application"));

    // Name and signature of the console command.
    protected string _signature;

    // The console command name.
    protected string _name;

    // The console command description.
    protected string _description;

    // The console command help text.
    protected string help;

    // Indicates whether the command should be shown in the Artisan command list.
    protected bool _hidden;

    // Create a new console command instance.
    this() {
        // We will go ahead and set the name, description, and parameters on console
        // commands just to make things a little easier on the developer. This is
        // so they don't have to all be manually specified in the constructors.
/*         if (isset($this->signature)) {
            $this->configureUsingFluentDefinition();
        } else {
            parent::__construct($this->name);
        }
 */
        // Once we have constructed the command, we'll set the description and other
        // related properties of the command. If a signature wasn't used to build
        // the command we'll set the arguments and the options on this command.
/*         $this->setDescription((string) $this->description);

        $this->setHelp((string) $this->help);

        $this->setHidden($this->isHidden());

        if (! isset($this->signature)) {
            $this->specifyParameters();
        } */
    }

    // Configure the console command using a fluent definition.
    protected void configureUsingFluentDefinition() {
/*         [$name, $arguments, $options] = Parser::parse($this->signature);

        parent::__construct($this->name = $name);

        // After parsing the signature we will spin through the arguments and options
        // and set them on this command. These will already be changed into proper
        // instances of these "InputArgument" and "InputOption" Symfony classes.
        $this->getDefinition()->addArguments($arguments);
        $this->getDefinition()->addOptions($options);
 */    }

    // Run the console command.
    /* int run(IAPPInput input_, IAPPOutput output_) {
         $this->output = $this->laravel->make(
            OutputStyle::class, ['input' => $input, 'output' => $output]
        );

        return parent::run(
            $this->input = $input, $this->output
        ); 
        return 0;
     }*/

    // Execute the console command.
    /* int execute(IAPPInput input_, IAPPOutput output_) {
         $method = method_exists($this, 'handle') ? 'handle' : '__invoke';

        return (int) $this->laravel->call([$this, $method]);
    return 0; 
      }*/

    /**
     * Resolve the console command instance for the given command.
     *
     * @param  \Symfony\Component\Console\Command\Command|string  $command
     * @return \Symfony\Component\Console\Command\Command
     */
    /* protected function resolveCommand($command)
    {
        if (! class_exists($command)) {
            return $this->getApplication()->find($command);
        }

        $command = $this->laravel->make($command);

        if ($command instanceof SymfonyCommand) {
            $command->setApplication($this->getApplication());
        }

        if ($command instanceof self) {
            $command->setLaravel($this->getLaravel());
        }

        return $command;
    } */

    bool isHidden() {
      return _hidden; }

    /**
     * {@inheritdoc}
     *
     * @return static
     */
    O setHidden(this O)(bool newValue) {
      _hidden = newValue;
      return cast(O)this; }

}

version(test_uim_apps) { unittest {
  // assert(Command);
}}