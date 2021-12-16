module uim.apps.views.components.buttons;

@safe:
import uim.apps;

DH5Obj linkList(string path, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"background-color:#35A6FF", "href":path~"/"], 
    tablerIcon("list", ["text-uim"])~"Übersicht");
}
DH5Obj linkCreate(string path, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"color:#35A6FF", "href":path~"/create"], 
    tablerIcon("plus", ["text-uim"])~"Erstellen");
}
DH5Obj linkView(string path, string id, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"color:#35A6FF", "href":path~"/view?entity_id="~id], 
    tablerIcon("eye", ["text-uim"])~"Anzeigen");
}

DH5Obj linkEdit(string path, string id, string[] classes = null) {
  return H5A(["style":"color:#35A6FF", "href":path~"/edit?entity_id="~id], tablerIcon("edit", ["text-uim"])~"Bearbeiten");
}
DH5Obj linkDelete(string path, string id, string[] classes = null) {
  return BS5ButtonLink(
    ["text-white"]~classes, ["style":"background-color:#35A6FF", "href":path~"/delete?entity_id="~id], 
    tablerIcon("trash", ["text-white"])~"Löschen");
}

DH5Obj alertLinkList(string path, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":path~"/"], tablerIcon("list")~" Übersicht");
}
DH5Obj alertLinkCreate(string path, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":path~"/create"], tablerIcon("plus")~" Erstellen");
}
DH5Obj alertLinkView(string path, string id, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":path~"/view?entity_id="~id], tablerIcon("eye")~" Anzeigen");
}
DH5Obj alertLinkEdit(string path, string id, string[] classes = null) {
  return BS5AlertLink(["href":path~"/edit?entity_id="~id], tablerIcon("edit")~" Bearbeiten");
}
DH5Obj alertLinkDelete(string path, string id, string[] classes = null) {
  return BS5AlertLink(["href":path~"/delete?entity_id="~id], tablerIcon("trash")~" Löschen");
}

DH5Obj linkPrev(string id = null, bool disabled = false) {
  DH5Obj result;
  if (disabled) result = H5Li(["pageitem", "disabled"]);
  else result = H5Li(["pageitem"]);

  if (id) result.id(id);
  
  result(H5A(["page-link"], ["href":"#"], "Vorherige "~tablerIcon("chevrons-left")));
  return result;
}

DH5Obj linkNext(string id = null, bool disabled = false) {
  DH5Obj result;
  if (disabled) result = H5Li(["pageitem", "disabled"]);
  else result = H5Li(["pageitem"]);

  if (id) result.id(id);
  result(H5A(["page-link"], ["href":"#"], "Nächste "~tablerIcon("chevrons-right")));
  return result;
}

DH5Obj buttonLinkRefresh(string path, string[] classes = null) {
  return BS5ButtonLink(
    ["me-3"]~classes, ["style":"background-color:white;border-color:#35A6FF;color:#35A6FF;", "href":path], 
    tablerIcon("refresh", ["text-uim"])~"Neuladen");
}
DH5Obj buttonLinkRefresh(string path, string id, string[] classes = ["me-1"]) {
  return BS5ButtonLink(
    ["text-white", "me-3"]~classes, ["style":"background-color:#35A6FF", "href":path~"/edit?entity_id="~id], 
    tablerIcon("refresh", ["text-white"])~"Neuladen");
}

DH5Obj buttonLinkList(string path, string[] classes = null) {
  return BS5ButtonLink(["text-white me-3"]~classes, ["style":"background-color:#35A6FF", "href":path~"/"], 
    tablerIcon("list", ["text-white"])~"Übersicht");
}

DH5Obj buttonLinkCreate(string path, string[] classes = ["me-1"]) {
  return BS5ButtonLink(["text-white"]~classes, ["style":"background-color:#35A6FF", "href":path~"/create"], 
    tablerIcon("plus", ["text-white"])~"Erstellen");
}
DH5Obj buttonLinkView(string path, string id, string[] classes = ["me-1"]) {
  return BS5ButtonLink(
    ["text-white"]~classes, ["style":"background-color:#35A6FF", "href":path~"/view?entity_id="~id], 
    tablerIcon("eye", ["text-white"])~"Anzeigen");
}

DH5Obj buttonLinkEdit(string path, string id, string[] classes = ["me-1"]) {
  return BS5ButtonLink(
    ["text-white"]~classes, ["style":"background-color:#35A6FF", "href":path~"/edit?entity_id="~id], 
    tablerIcon("edit", ["text-white"])~"Bearbeiten");
}
DH5Obj buttonLinkDelete(string path, string id, string[] classes = null) {
  return BS5ButtonLink(
    ["text-white"]~classes, ["style":"background-color:#35A6FF", "href":path~"/delete?entity_id="~id], 
    tablerIcon("trash", ["text-white"])~"Löschen");
}


DH5Obj submitDelete(string[] classes = null) {
  return BS5ButtonSubmit(
    ["text-white"]~classes, ["style":"background-color:#35A6FF"],  
    tablerIcon("trash", ["text-white"])~"Löschen");
}

DH5Obj buttonLinkCancel(string path, string[] classes = null) {
  return BS5ButtonLink(
    ["text-white me-1"]~classes, ["style":"background-color:#35A6FF", "href":path], 
    tablerIcon("x", ["text-white"])~"Abbrechen");
}

DH5Obj buttonLinkReset(string path, string id, string[] classes = null) {
  return
    BS5ButtonLink(["text-white me-1"]~classes, ["style":"background-color:#35A6FF", "href":path~"/edit?entity_id="~id],
      tablerIcon("reset", ["text-white"])~"Reset");
}

DH5Obj resetClear(string[] classes = null) {
  return 
    BS5ButtonReset(["btn-secondary me-1"],  
      tablerIcon("eraser", ["text-white"])~"Clear");
}

DH5Obj submitSave(string[] classes = null) {
  return 
    BS5ButtonSubmit(["btn-success"],  
      tablerIcon("check", ["text-white"])~"Speichern");
}

string titleList(string title) {
  return tablerIcon("list")~title;
}

string titleView(string title) {
  return tablerIcon("eye")~title;
}

string titleEdit(string title) {
  return tablerIcon("edit")~title;
}

string titleDelete(string title) {
  return tablerIcon("trash")~title;
}