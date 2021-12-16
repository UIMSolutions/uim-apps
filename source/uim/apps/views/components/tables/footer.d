module uim.apps.views.components.tables.footer;

@safe:
import uim.apps;

class DAPPTableFooter : DAPPViewComponent {
    this() { 
      this.visibleEntities(10).pageNo(1); 
    }
    this(DAPPView myView) { this().view(myView); }

    mixin(SProperty!("size_t", "pageNo"));
    mixin(SProperty!("size_t", "visibleEntities"));
    mixin(SProperty!("DOOPEntity[]", "entities"));

    override void beforeH5(STRINGAA options = null) { // hook
        super.beforeH5(options);
        if (hasError) { return; }

      _h5Content ~= BS5CardFooter(["d-flex align-items-center"], 
          H5P(["m-0 text-muted"], "Showing <span>%s</span> to <span>%s</span> of <span>%s</span> entries".format(0, visibleEntities, entities.length)),
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
                  "Next"~tablerIcon("chevrons-right"))));
    } 

    override void beforeRender(STRINGAA options = null) { // hook
        super.beforeRender(options);
        if (hasError) { return; } 
    } 
} 
auto APPTableFooter() { return new DAPPTableFooter; }


