module uim.apps.applications;

@safe:
import uim.apps;

// Main
public import uim.apps.applications.application;

// MOdules
public import uim.apps.applications.registry;

// Global registry for applications
DAPPApplicationRegistry applicationRegistry;
static this() {
  applicationRegistry = APPApplicationRegistry;
}