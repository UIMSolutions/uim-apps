module uim.apps.views.components.tables.components.footers.entities;

@safe:
import uim.apps;

class DAPPEntitiesTableFooter : DAPPTableFooter {
  mixin(ViewComponentThis!("APPEntitiesTableFooter"));

  mixin(OProperty!("size_t", "pageNo"));
  mixin(OProperty!("size_t", "visibleEntities"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
    .visibleEntities(10)
    .pageNo(1); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
      super.toH5(options);
      if (hasError) { return null; }

    return [
        BS5CardFooter(["d-flex align-items-center"], 
        H5P(["m-0 text-muted"], "Showing <span>%s</span> to <span>%s</span> of <span>%s</span> entries".format(0, visibleEntities, 0)),
            BS5Pagination(["m-0 ms-auto"])
            .item(["disabled"],
                BS5PageLink(["href":"#", "tabindex":"-1", "aria-disabled":"true"], 
                tablerIcon("chevrons-left")~"Prev"))
            .item(
                BS5PageLink(["href":"#"], "1"))
            .item(["active"],
                BS5PageLink(["href":"#"], "2"))
            .item(
                BS5PageLink(["href":"#"], "3"))
            .item(
                BS5PageLink(["href":"#"], "4"))
            .item(
                BS5PageLink(["href":"#"], "5"))
            .item(
                BS5PageLink(["href":"#"], 
                "Next"~tablerIcon("chevrons-right"))))].toH5;
    } 
}
mixin(ViewComponentCalls!("APPEntitiesTableFooter"));
