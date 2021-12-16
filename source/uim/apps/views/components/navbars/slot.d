module uim.apps.views.components.navbars.slot;

@safe:
import uim.apps;

class DAPPNavbarSlot : DAPPViewComponent {
    this() {}
    this(string newId) {
      this.id(newId);
    }

    mixin(SProperty!("string", "id"));
    mixin(SProperty!("bool", "active"));

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
}
auto APPNavbarSlot() { return new DAPPNavbarSlot; }
