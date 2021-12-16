module uim.apps.views.view;

@safe:
import uim.apps;

class DAPPView : DH5AppView, IAPPEventDispatcher {
    this() { 
        super(); 
        this.name("APPView"); 
    }
    
    this(DAPPController myController) { 
        this().controller(myController); 
    }
    
    this(string myName) { 
        this().name(myName);
    }
    this(DAPPController myController, string N) { 
        this(myController).name(N);
    }

    mixin(OProperty!("IAPPEventManager", "eventManager")); 
    
    // An array of variables
    mixin(OProperty!("STRINGAA", "variables"));

    // List of variables to collect from the associated controller.
    protected string [] _passedVars = [
        "viewVars", "autoLayout", "helpers", "template", "layout", "name", "theme",
        "layoutPath", "templatePath", "plugin"];

    // Default custom config options.
    protected STRINGAA _defaultConfig;

    // Constant for view file type "template".
    const string TYPE_TEMPLATE = "template";

    // Constant for view file type "element"
    const string TYPE_ELEMENT = "element";

    // Constant for view file type "layout"
    const string TYPE_LAYOUT = "layout";

    // Constant for type used for App::path().
    const string NAME_TEMPLATE = "templates";

    // Constant for folder name containing files for overriding plugin templates.
    const string PLUGIN_TEMPLATE_FOLDER = "plugin";

    /**
     * Constructor
     *
     * @param \Cake\Http\ServerRequest|null request Request instance.
     * @param \Cake\Http\Response|null response Response instance.
     * @param \Cake\Event\EventManager|null eventManager Event manager instance.
     * @param array<string, mixed> viewOptions View options. See {@link View::_passedVars} for list of
     *   options which get set as class properties.
     */
/*     this(HTTPServerRequest request = null, HTTPServerResponse response = null, DAPPEventManager eventManager = null, STRINGAA viewOptions = null) {
        this.request = request;
        this.response = response;

         foreach (this._passedVars as var) {
            if (isset(viewOptions[var])) { this.{var} = viewOptions[var]; }
        }
        this.setConfig(array_diff_key(
            viewOptions,
            array_flip(this._passedVars)
        ));

        if (eventManager !== null) {
            this.setEventManager(eventManager);
        }
        if (request === null) {
            request = Router::getRequest() ?: new ServerRequest(["base" => "", "url" => "", "webroot" => "/"]);
        }
        this.Blocks = new this._viewBlockClass();
        this.initialize();
        this.loadHelpers(); 
    }*/

    // Initialization hook method.
    // Properties like helpers etc. cannot be initialized statically in your custom
    // view class as they are overwritten by values from controller in constructor.
    // So this method allows you to manipulate them as required after view instance is constructed.
    void initialize() {}

    // #region autoLayout
        // Turns on or off conventional mode of applying layout files. On by default.
        // Setting to off means that layouts will not be automatically applied to rendered templates.
        protected bool _autoLayout = true;

        // Returns if conventional mode of applying layout files is enabled.
        // Disabled means that layouts will not be automatically applied to rendered views.
        bool isAutoLayoutEnabled() { return _autoLayout; }

        // Turns on or off conventional mode of applying layout files.
        // On by default. Setting to off means that layouts will not be
        // automatically applied to rendered views.    
        O enableAutoLayout(this O)(bool enable = true) {
            _autoLayout = enable;
            return cast(O)this; }

        // Turns off conventional mode of applying layout files.
        // Layouts will not be automatically applied to rendered views.
        O disableAutoLayout(this O)() {
            _autoLayout = false;
            return cast(O)this; }
    // #endregion autoLayout

    // #region theme
        // The view theme to use.
        protected string _theme;

        // Get the current view theme.
        string theme() {
            return _theme; }

        // Set the view theme to use.
        O theme(this O)(string newTheme) {
            _theme = newTheme;
            return cast(O)this; }
    // #endregion theme

    /**
     * Get config value.
     *
     * Currently if config is not set it fallbacks to checking corresponding
     * view var with underscore prefix. Using underscore prefixed special view
     * vars is deprecated and this fallback will be removed in CakePHP 4.1.0.
     *
     * @param string|null key The key to get or null for the whole config.
     * @param mixed default The return value when the key does not exist.
     * @return mixed Config value being read.
     * @psalm-suppress PossiblyNullArgument
     */
    auto getConfig(string key = null, string defaultValue = null) {
        // if (auto value = this.getConfig(key)) return value;

/*         if (isset(this.viewVars["_{key}"])) {
            deprecationWarning(sprintf(
                "Setting special view var "_%s" is deprecated. Use ViewBuilder::setOption(\"%s\", value) instead.",
                key,
                key
            ));

            return this.viewVars["_{key}"];
        }
 */
        return defaultValue;
    }

    /**
     * Renders a piece of PHP with provided parameters and returns HTML, XML, or any other string.
     *
     * This realizes the concept of Elements, (or "partial layouts") and the params array is used to send
     * data to be used in the element. Elements can be cached improving performance by using the `cache` option.
     *
     * @param string name Name of template file in the `templates/element/` folder,
     *   or `MyPlugin.template` to use the template element from MyPlugin. If the element
     *   is not found in the plugin, the normal view path cascade will be searched.
     * @param STRINGAA data Array of data to be made available to the rendered view (i.e. the Element)
     * @param array<string, mixed> options Array of options. Possible keys are:
     *
     * - `cache` - Can either be `true`, to enable caching using the config in View::elementCache. Or an array
     *   If an array, the following keys can be used:
     *
     *   - `config` - Used to store the cached element in a custom cache configuration.
     *   - `key` - Used to define the key used in the Cache::write(). It will be prefixed with `element_`
     *
     * - `callbacks` - Set to true to fire beforeRender and afterRender helper callbacks for this element.
     *   Defaults to false.
     * - `ignoreMissing` - Used to allow missing elements. Set to true to not throw exceptions.
     * - `plugin` - setting to false will force to use the application"s element from plugin templates, when the
     *   plugin has element with same name. Defaults to true
     * @return string Rendered Element
     * @throws \Cake\View\Exception\MissingElementException When an element is missing and `ignoreMissing`
     *   is false.
     * @psalm-param array{cache?:array|true, callbacks?:bool, plugin?:string|false, ignoreMissing?:bool} options
     */
    string element(string name, STRINGAA data = null, STRINGAA options = null){
/*         options += ["callbacks" => false, "cache" => null, "plugin" => null, "ignoreMissing" => false];
        if (isset(options["cache"])) {
            options["cache"] = this._elementCache(
                name,
                data,
                array_diff_key(options, ["callbacks" => false, "plugin" => null, "ignoreMissing" => null])
            );
        }

        pluginCheck = options["plugin"] !== false;
        file = this._getElementFileName(name, pluginCheck);
        if (file && options["cache"]) {
            return this.cache(function () use (file, data, options): void {
                echo this._renderElement(file, data, options);
            }, options["cache"]);
        }

        if (file) return this._renderElement(file, data, options);
        if (options["ignoreMissing"]) return "";

        [plugin, elementName] = this.pluginSplit(name, pluginCheck);
        paths = iterator_to_array(this.getElementPaths(plugin));
 */        return null; // throw new MissingElementException([name . this._ext, elementName . this._ext], paths);
    }

    /**
     * Create a cached block of view logic.
     *
     * This allows you to cache a block of view output into the cache
     * defined in `elementCache`.
     *
     * This method will attempt to read the cache first. If the cache
     * is empty, the block will be run and the output stored.
     *
     * @param callable block The block of code that you want to cache the output of.
     * @param array<string, mixed> options The options defining the cache key etc.
     * @return string The rendered content.
     * @throws \RuntimeException When options is lacking a "key" option.
     */
/*     string cache(callable block, STRINGAA options = null) {
        options += ["key" => "", "config" => this.elementCache];
        if (empty(options["key"])) {
            throw new RuntimeException("Cannot cache content with an empty key");
        }
        result = Cache::read(options["key"], options["config"]);
        if (result) {
            return result;
        }

        bufferLevel = ob_get_level();
        ob_start();

        try {
            block();
        } catch (Throwable exception) {
            while (ob_get_level() > bufferLevel) {
                ob_end_clean();
            }

            throw exception;
        }

        result = ob_get_clean();

        Cache::write(options["key"], result, options["config"]);

        return result;
    }
 */
    // Checks if an element exists
    bool elementExists(string name) {
        // return _getElementFileName(name).length > 0;
        return false;
    }

    /**
     * Renders a layout. Returns output from _render().
     *
     * Several variables are created for use in layout.
     *
     * @param string content Content to render in a template, wrapped by the surrounding layout.
     * @param string|null layout Layout name
     * @return string Rendered output.
     * @throws \Cake\Core\Exception\CakeException if there is an error in the view.
     * @triggers View.beforeLayout this, [layoutFileName]
     * @triggers View.afterLayout this, [layoutFileName]
     */
    string renderLayout(string content, string layout = null) {
        // auto layoutFileName = _getLayoutFileName(layout);

/*         if (!empty(content)) {
            this.Blocks.set("content", content);
        }

        this.dispatchEvent("View.beforeLayout", [layoutFileName]);

        title = this.Blocks.get("title");
        if (title === "") {
            title = Inflector::humanize(str_replace(DIRECTORY_SEPARATOR, "/", this.templatePath));
            this.Blocks.set("title", title);
        }

        this._currentType = static::TYPE_LAYOUT;
        this.Blocks.set("content", this._render(layoutFileName));

        this.dispatchEvent("View.afterLayout", [layoutFileName]);

        return this.Blocks.get("content");
 */    return null;
        }

    /**
     * Returns a list of variables available in the current View context
     *
     * @return string[] Array of the set view variable names.
     */
    string[] getVars() {
        // return array_keys(this.viewVars);
        return null;
    }

    /**
     * Returns the contents of the given View variable.
     *
     * @param string var The view var you want the contents of.
     * @param mixed default The default/fallback content of var.
     * @return mixed The content of the named var if its set, otherwise default.
     */
/*     public function get(string var, defaultValue = null)
    {
        return this.viewVars[var] ?? default;
    }
 */
    /**
     * Saves a variable or an associative array of variables for use inside a template.
     *
     * @param array|string name A string or an array of data.
     * @param mixed value Value in case name is a string (which then works as the key).
     *   Unused if name is an associative array, otherwise serves as the values to name"s keys.
     * @throws \RuntimeException If the array combine operation failed.
     */
    O set(this O)(string name, string value = null) {
/*         if (is_array(name)) {
            if (is_array(value)) {
                /** @var array|false data  * /
                data = array_combine(name, value);
                if (data === false) {
                    throw new RuntimeException(
                        "Invalid data provided for array_combine() to work: Both name and value require same count."
                    );
                }
            } else {
                data = name;
            }
        } else {
            data = [name => value];
        }
        this.viewVars = data + this.viewVars;
 */
        return cast(O)this;
    }

    /**
     * Append to an existing or new block.
     *
     * Appending to a new block will create the block.
     *
     * @param string name Name of the block
     * @param mixed value The content for the block. Value will be type cast
     *   to string.
     * @return this
     * @see \Cake\View\ViewBlock::concat()
     */
    O append(this O)(string name, string value = null) {
/*         this.Blocks.concat(name, value);

 */        return cast(O)this;
    }

    /**
     * Prepend to an existing or new block.
     *
     * Prepending to a new block will create the block.
     *
     * @param string name Name of the block
     * @param mixed value The content for the block. Value will be type cast
     *   to string.
     * @see \Cake\View\ViewBlock::concat()
     */
    O prepend(this O)(string name, string value) {
/*         this.Blocks.concat(name, value, ViewBlock::PREPEND);
 */
        return cast(O)this;
    }

    /**
     * Set the content for a block. This will overwrite any
     * existing content.
     *
     * @param string name Name of the block
     * @param mixed value The content for the block. Value will be type cast
     *   to string.
     * @return this
     * @see \Cake\View\ViewBlock::set()
     */
    O assign(this O)(string name, value) {
/*         this.Blocks.set(name, value);
 */
        return cast(O)this;
    }

    /**
     * Reset the content for a block. This will overwrite any
     * existing content.
     *
     * @param string name Name of the block
     * @return this
     * @see \Cake\View\ViewBlock::set()
     */
    O reset(this O)(string name) {
/*         this.assign(name, "");
 *//* 
 */        return cast(O)this;
    }

    /**
     * Fetch the content for a block. If a block is
     * empty or undefined "" will be returned.
     *
     * @param string name Name of the block
     * @param string default Default text
     * @return string The block content or default if the block does not exist.
     * @see \Cake\View\ViewBlock::get()
     */
    string fetch(string name, string defaultValue = "") {
/*         return this.Blocks.get(name, default);
 */    
    return null;
    }

    // End a capturing block. The compliment to View::start()
    O end(this O)() {
        this.Blocks.end();
        return cast(O)this; }

    // Check if a block exists
    bool exists(string blockName) {
        // return this.Blocks.exists(blockName);
        return false; }

    /**
     * Provides template or element extension/inheritance. Templates can extends a
     * parent template and populate blocks in the parent template.
     *
     * @param string name The template or element to "extend" the current one with.
     * @return this
     * @throws \LogicException when you extend a template with itself or make extend loops.
     * @throws \LogicException when you extend an element which doesn"t exist
     */
    O extend(this O)(string name) {
/*         type = name[0] === "/" ? static::TYPE_TEMPLATE : this._currentType;
        switch (type) {
            case static::TYPE_ELEMENT:
                parent = this._getElementFileName(name);
                if (!parent) {
                    [plugin, name] = this.pluginSplit(name);
                    paths = this._paths(plugin);
                    defaultPath = paths[0] . static::TYPE_ELEMENT . DIRECTORY_SEPARATOR;
                    throw new LogicException(sprintf(
                        "You cannot extend an element which does not exist (%s).",
                        defaultPath . name . this._ext
                    ));
                }
                break;
            case static::TYPE_LAYOUT:
                parent = this._getLayoutFileName(name);
                break;
            default:
                parent = this._getTemplateFileName(name);
        }

        if (parent === this._current) {
            throw new LogicException("You cannot have templates extend themselves.");
        }
        if (isset(this._parents[parent]) && this._parents[parent] === this._current) {
            throw new LogicException("You cannot have templates extend in a loop.");
        }
        this._parents[this._current] = parent;
 */
        return cast(O)this;
    }

/*     // Retrieve the current template type
    string getCurrentType() {
        return _currentType;
    } */

    /**
     * Magic accessor for helpers.
     *
     * @param string name Name of the attribute to get.
     * @return \Cake\View\Helper|null
     */
/*     public function __get(string name)
    {
        registry = this.helpers();
        if (!isset(registry.{name})) {
            return null;
        }

        this.{name} = registry.{name};

        return registry.{name};
    } */

    // Interact with the HelperRegistry to load all the helpers.
    O loadHelpers(this O)() {
/*         registry = this.helpers();
        helpers = registry.normalizeArray(this.helpers);
        foreach (helpers as properties) {
            this.loadHelper(properties["class"], properties["config"]);
        }
 */
        return cast(O)this;
    }

    /**
     * Renders and returns output for given template filename with its
     * array of data. Handles parent/extended templates.
     *
     * @param string templateFile Filename of the template
     * @param STRINGAA data Data to include in rendered view. If empty the current
     *   View::viewVars will be used.
     * @return string Rendered output
     * @throws \LogicException When a block is left open.
     * @triggers View.beforeRenderFile this, [templateFile]
     * @triggers View.afterRenderFile this, [templateFile, content]
     */

    /**
     * Sandbox method to evaluate a template / view script in.
     *
     * @param string templateFile Filename of the template.
     * @param STRINGAA dataForView Data to include in rendered view.
     * @return string Rendered output
     */
/*     protected function _evaluate(string templateFile, STRINGAA dataForView): string
    {
        extract(dataForView);

        bufferLevel = ob_get_level();
        ob_start();

        try {
            // Avoiding templateFile here due to collision with extract() vars.
            include func_get_arg(0);
        } catch (Throwable exception) {
            while (ob_get_level() > bufferLevel) {
                ob_end_clean();
            }

            throw exception;
        }

        return ob_get_clean();
    } */

    /**
     * Get the helper registry in use by this View class.
     * @return \Cake\View\HelperRegistry
     */
/*     public function helpers(): HelperRegistry
    {
        if (this._helpers === null) {
            this._helpers = new HelperRegistry(this);
        }

        return this._helpers;
    } */

    /**
     * Loads a helper. Delegates to the `HelperRegistry::load()` to load the helper
     *
     * @param string name Name of the helper to load.
     * @param array<string, mixed> config Settings for the helper
     * @return \Cake\View\Helper a constructed helper object.
     * @see \Cake\View\HelperRegistry::load()
     */
/*     public function loadHelper(string name, array config = []): Helper
    {
        [, class] = pluginSplit(name);
        helpers = this.helpers();

        return this.{class} = helpers.load(name, config);
    }
 */
    // Set sub-directory for this template files.
    mixin(OProperty!("string", "subDir"));

    // The name of the plugin.
    mixin(OProperty!("string", "plugin"));

    // Set The cache configuration View will use to store cached elements
    O elementCache(this O)(string elementCache) {
        _elementCache = elementCache;
        return cast(O)this; } 

    /**
     * Returns filename of given action"s template file as a string.
     * CamelCased action names will be under_scored by default.
     * This means that you can have LongActionNames that refer to
     * long_action_names.php templates. You can change the inflection rule by
     * overriding _inflectTemplateFileName.
     *
     * @param string|null name Controller action to find template filename for
     * @return string Template filename
     * @throws \Cake\View\Exception\MissingTemplateException when a template file could not be found.
     * @throws \RuntimeException When template name not provided.
     */
/*     protected function _getTemplateFileName(?string name = null): string
    {
        templatePath = subDir = "";

        if (this.templatePath) {
            templatePath = this.templatePath . DIRECTORY_SEPARATOR;
        }
        if (this.subDir !== "") {
            subDir = this.subDir . DIRECTORY_SEPARATOR;
            // Check if templatePath already terminates with subDir
            if (templatePath != subDir && substr(templatePath, -strlen(subDir)) === subDir) {
                subDir = "";
            }
        }

        if (name === null) {
            name = this.template;
        }

        if (empty(name)) {
            throw new RuntimeException("Template name not provided");
        }

        [plugin, name] = this.pluginSplit(name);
        name = str_replace("/", DIRECTORY_SEPARATOR, name);

        if (strpos(name, DIRECTORY_SEPARATOR) === false && name !== "" && name[0] !== ".") {
            name = templatePath . subDir . this._inflectTemplateFileName(name);
        } elseif (strpos(name, DIRECTORY_SEPARATOR) !== false) {
            if (name[0] === DIRECTORY_SEPARATOR || name[1] === ":") {
                name = trim(name, DIRECTORY_SEPARATOR);
            } elseif (!plugin || this.templatePath !== this.name) {
                name = templatePath . subDir . name;
            } else {
                name = subDir . name;
            }
        }

        name .= this._ext;
        paths = this._paths(plugin);
        foreach (paths as path) {
            if (is_file(path . name)) {
                return this._checkFilePath(path . name, path);
            }
        }

        throw new MissingTemplateException(name, paths);
    } */

    /**
     * Change the name of a view template file into underscored format.
     *
     * @param string name Name of file which should be inflected.
     * @return string File name after conversion
     */
/*     protected function _inflectTemplateFileName(string name): string
    {
        return Inflector::underscore(name);
    } */

    /**
     * Check that a view file path does not go outside of the defined template paths.
     *
     * Only paths that contain `..` will be checked, as they are the ones most likely to
     * have the ability to resolve to files outside of the template paths.
     *
     * @param string file The path to the template file.
     * @param string path Base path that file should be inside of.
     * @return string The file path
     * @throws \InvalidArgumentException
     */
/*     protected function _checkFilePath(string file, string path): string
    {
        if (strpos(file, "..") === false) {
            return file;
        }
        absolute = realpath(file);
        if (strpos(absolute, path) !== 0) {
            throw new InvalidArgumentException(sprintf(
                "Cannot use "%s" as a template, it is not within any view template path.",
                file
            ));
        }

        return absolute;
    } */

    /**
     * Splits a dot syntax plugin name into its plugin and filename.
     * If name does not have a dot, then index 0 will be null.
     * It checks if the plugin is loaded, else filename will stay unchanged for filenames containing dot
     *
     * @param string name The name you want to plugin split.
     * @param bool fallback If true uses the plugin set in the current Request when parsed plugin is not loaded
     * @return array Array with 2 indexes. 0 => plugin name, 1 => filename.
     * @psalm-return array{string|null, string}
     */
/*     public function pluginSplit(string name, bool fallback = true): array
    {
        plugin = null;
        [first, second] = pluginSplit(name);
        if (first && Plugin::isLoaded(first)) {
            name = second;
            plugin = first;
        }
        if (isset(this.plugin) && !plugin && fallback) {
            plugin = this.plugin;
        }

        return [plugin, name];
    } */

    /**
     * Returns layout filename for this template as a string.
     *
     * @param string|null name The name of the layout to find.
     * @return string Filename for layout file.
     * @throws \Cake\View\Exception\MissingLayoutException when a layout cannot be located
     * @throws \RuntimeException
     */
/*     protected function _getLayoutFileName(?string name = null): string
    {
        if (name === null) {
            if (empty(this.layout)) {
                throw new RuntimeException(
                    "View::layout must be a non-empty string." .
                    "To disable layout rendering use method View::disableAutoLayout() instead."
                );
            }
            name = this.layout;
        }
        [plugin, name] = this.pluginSplit(name);
        name .= this._ext;

        foreach (this.getLayoutPaths(plugin) as path) {
            if (is_file(path . name)) {
                return this._checkFilePath(path . name, path);
            }
        }

        paths = iterator_to_array(this.getLayoutPaths(plugin));
        throw new MissingLayoutException(name, paths);
    }
 */
    /**
     * Get an iterator for layout paths.
     *
     * @param string|null plugin The plugin to fetch paths for.
     * @return \Generator
     */
/*     protected function getLayoutPaths(?string plugin)
    {
        subDir = "";
        if (this.layoutPath) {
            subDir = this.layoutPath . DIRECTORY_SEPARATOR;
        }
        layoutPaths = this._getSubPaths(static::TYPE_LAYOUT . DIRECTORY_SEPARATOR . subDir);

        foreach (this._paths(plugin) as path) {
            foreach (layoutPaths as layoutPath) {
                yield path . layoutPath;
            }
        }
    } */

    /**
     * Finds an element filename, returns false on failure.
     *
     * @param string name The name of the element to find.
     * @param bool pluginCheck - if false will ignore the request"s plugin if parsed plugin is not loaded
     * @return string|false Either a string to the element filename or false when one can"t be found.
     */
/*     string _getElementFileName(string name, bool pluginCheck = true) {
        [plugin, name] = this.pluginSplit(name, pluginCheck);

        auto name .= this._ext;
        foreach (this.getElementPaths(plugin) as path) {
            if (is_file(path . name)) {
                return path . name;
            }
        }

        return null;
    }
 */
    /**
     * Get an iterator for element paths.
     *
     * @param string|null plugin The plugin to fetch paths for.
     * @return \Generator
     */
   /*  protected function getElementPaths(?string plugin)
    {
        elementPaths = this._getSubPaths(static::TYPE_ELEMENT);
        foreach (this._paths(plugin) as path) {
            foreach (elementPaths as subdir) {
                yield path . subdir . DIRECTORY_SEPARATOR;
            }
        }
    } */

    /**
     * Find all sub templates path, based on basePath
     * If a prefix is defined in the current request, this method will prepend
     * the prefixed template path to the basePath, cascading up in case the prefix
     * is nested.
     * This is essentially used to find prefixed template paths for elements
     * and layouts.
     *
     * @param string basePath Base path on which to get the prefixed one.
     * @return string[] Array with all the templates paths.
     */
    string[] _getSubPaths(string basePath) {
        auto paths = [basePath];
/*         if (this.request.getParam("prefix")) {
            auto prefixPath = explode("/", this.request.getParam("prefix"));
            auto path = "";
            foreach (prefixPath as prefixPart) {
                path .= Inflector::camelize(prefixPart) . DIRECTORY_SEPARATOR;

                array_unshift(
                    paths,
                    path . basePath
                );
            }
        } */

        return paths;
    }

    /**
     * Return all possible paths to find view files in order
     *
     * @param string|null plugin Optional plugin name to scan for view files.
     * @param bool cached Set to false to force a refresh of view paths. Default true.
     * @return string[] paths
     */
    string[] paths(string plugin = null, bool cached = true) {
/*         if (cached === true) {
            if (plugin === null && !empty(this._paths)) {
                return this._paths;
            }
            if (plugin !== null && isset(this._pathsForPlugin[plugin])) {
                return this._pathsForPlugin[plugin];
            }
        }
        templatePaths = App::path(static::NAME_TEMPLATE);
        pluginPaths = themePaths = [];
        if (!empty(plugin)) {
            for (i = 0, count = count(templatePaths); i < count; i++) {
                pluginPaths[] = templatePaths[i]
                    . static::PLUGIN_TEMPLATE_FOLDER
                    . DIRECTORY_SEPARATOR
                    . plugin
                    . DIRECTORY_SEPARATOR;
            }
            pluginPaths[] = Plugin::templatePath(plugin);
        }

        if (!empty(this.theme)) {
            themePaths[] = Plugin::templatePath(Inflector::camelize(this.theme));

            if (plugin) {
                for (i = 0, count = count(themePaths); i < count; i++) {
                    array_unshift(
                        themePaths,
                        themePaths[i]
                            . static::PLUGIN_TEMPLATE_FOLDER
                            . DIRECTORY_SEPARATOR
                            . plugin
                            . DIRECTORY_SEPARATOR
                    );
                }
            }
        }

        paths = array_merge(
            themePaths,
            pluginPaths,
            templatePaths,
            App::core("templates")
        );

        if (plugin !== null) {
            return this._pathsForPlugin[plugin] = paths;
        }
 */
/*         return this._paths = paths;
 */ return null;   
    }

    /**
     * Generate the cache configuration options for an element.
     *
     * @param string name Element name
     * @param STRINGAA data Data
     * @param array<string, mixed> options Element options
     * @return array Element Cache configuration.
     * @psalm-return array{key:string, config:string}
     */
    auto elementCache(string name, STRINGAA data, STRINGAA options) {
/*         if (isset(options["cache"]["key"], options["cache"]["config"])) {
            /** @psalm-var array{key:string, config:string}* /
            cache = options["cache"];
            cache["key"] = "element_" . cache["key"];

            return cache;
        }

        [plugin, name] = this.pluginSplit(name);

        pluginKey = null;
        if (plugin) {
            pluginKey = str_replace("/", "_", Inflector::underscore(plugin));
        }
        elementKey = str_replace(["\\", "/"], "_", name);

        cache = options["cache"];
        unset(options["cache"]);
        keys = array_merge(
            [pluginKey, elementKey],
            array_keys(options),
            array_keys(data)
        );
 */        
        auto config = [
            "config": "this.elementCache",
            "key": "implode(\"_\", keys)"
        ];
/*         if (is_array(cache)) {
            config = cache + config;
        }
        config["key"] = "element_" . config["key"];
 */
        return config;
    }


    override void beforeH5(STRINGAA options = null) {
        debugMethodCall(moduleName!DAPPView~":DAPPView::beforeH5"); 
        super.beforeH5(options);
        debug writeln("-> Back to ", "DAPPView::beforeH5"); 
        if (hasError) { return; }

/* H5Div(["wrapper"], 
        head~
        H5Div(["page-wrapper bg-white"],
          pHeader ? BS5Container.fluid()(pHeader.toH5(options)) : null,
          H5Div(["page-body"], H5Div(["container-fluid"], view.toH5(options)))
        ).toString
        // foot
      ).toString,
 */      
        _h5Content ~= H5Div(["content"],
            BS5Row("messages", [""]),
            BS5Row(["row-cards"],
            /* pageContent(options) */
            ));        
    }  
  unittest {
    version(uim_apps) {
      // TODO test
      }} 
}
auto APPView() { return new DAPPView(); }
auto APPView(DAPPController myController) { return new DAPPView(myController); }
auto APPView(string myName) { return new DAPPView(myName); }
auto APPView(DAPPController myController, string myName) { return new DAPPView(myController, myName); }