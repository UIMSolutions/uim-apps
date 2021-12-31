module uim.apps.views.pages;

@safe:
import uim.apps;

public import uim.apps.views.pages.components;

auto myJsPath = "";

void crudPages(T:DOOPEntity)(DAPPApplication app) {
  auto entity = new T;
  auto entityClasses = entity.entityClasses;
  // debug writeln(entityClasses); 
  if (entityClasses.indexOf("uim") == 0) app.crudPages!T(entityClasses.replace("uim", "uim/"), entityClasses);
  if (entityClasses.indexOf("bsi") == 0) app.crudPages!T(entityClasses.replace("bsi", "bsi/"), entityClasses);
}

void crudPages(T:DOOPEntity)(DAPPApplication app, string name, string pool) {
  auto api = /* "api/v1/uim/" */name;
  auto url = "entities/"~name;
  crudPages!T(app, api, pool, url); 
}

void crudPages(T:DOOPEntity)(DAPPApplication app, string api, string pool, string url) {
  // debug writeln(url); 
  app.pages(url,            new DAPPListPage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/create",  new DAPPCreatePage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/read",    new DAPPReadPage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/update",  new DAPPUpdatePage!T()/* .api(api).pool(pool).url(url) */);
  app.pages(url~"/delete",  new DAPPDeletePage!T()/* .api(api).pool(pool).url(url) */);
}