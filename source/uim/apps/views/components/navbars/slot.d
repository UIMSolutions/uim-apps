module uim.apps.views.components.navbars.slot;

@safe:
import uim.apps;

class DAPPNavbarSlot : DViewComponent {
    mixin(ViewComponentThis!("APPNavbarSlot"));
    this(string newId) {
      this.id(newId);
    }

    mixin(OProperty!("bool", "active"));
    mixin(OProperty!("string", "title"));
    mixin(OProperty!("DBS5DropdownMenu", "menu"));

/*     override string toString() { return toString(null); }
    string toString(STRINGAA options = null) {   
        if (_id.length > 0) _content.id(_id);
        if (_active) _content.classes("active"); else _content.removeClasses("active");
        return _content.toString();
    }
 */
    override void beforeH5(STRINGAA options = null) {
        super.beforeH5(options);
        if (hasError) { return; }
    }

    override DH5Obj[] toH5(STRINGAA options = null) {
        super.toH5(options);

    return [
      BS5NavItem(["dropdown"], 
        BS5NavLink(["dropdown-toggle"], ["href":"#navbar-slot", "data-bs-toggle":"dropdown", "role":"button", "aria-expanded":"false"], 
            BS5NavLinkTitle(title)),
        menu
      )].toH5;
    }
}
mixin(ViewComponentCalls!("APPNavbarSlot"));
