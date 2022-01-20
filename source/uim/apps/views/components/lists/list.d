module uim.apps.views.components.lists.list;

@safe:
import uim.apps;

class DAPPListComponent : DAPPViewComponent {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }

  mixin(OProperty!("DOOPEntity[]", "entities"));
  mixin(SProperty!("DH5Obj", "noEntities"));
  mixin(SProperty!("DOOPEntity[UUID]", "themesById"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln("Found entities: ", entities.length);

    DH5Obj[] inners;
    
    return [
      BS5Row(["row-cards"], ["data-masonry":"{&quot;percentPosition&quot;: true }"], inners)].toH5; 
  }
}
auto APPListComponent() { return new DAPPListComponent(); }
auto APPListComponent(DAPPView myView) { return new DAPPListComponent(myView); }