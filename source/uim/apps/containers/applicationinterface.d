module uim.apps.containers.applicationinterface;

@safe:
import uim.apps;

// Interface for applications that configure and use a dependency injection container.
interface IAPPContainerApplication {
    //Register services to the container
    // Registered services can have instances fetched out of the container using `get()`. 
    // Dependencies and parameters will be resolved based on service definitions.
    void services(IAPPContainer container);

    // Create a new container and register services.
    // This will `register()` services provided by both the application
    // and any plugins if the application has plugin support.
    IAPPContainer getContainer();
}
