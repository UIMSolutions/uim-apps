module uim.apps.views.components.tables;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.tables.table;

// Packages
public import uim.apps.views.components.tables.components;

// Modules
public import uim.apps.views.components.tables.filter;
public import uim.apps.views.components.tables.history;
public import uim.apps.views.components.tables.listheader;
public import uim.apps.views.components.tables.versions;

auto listEntities(T:DOOPEntity)(string rootPath, string mainTitle, int numberEntities, STRINGAA[] columns, T[] entities, int startPos, int endPos, size_t sumEntities) {
  auto header(string rootPath, STRINGAA[] columns) {
    auto tr = H5Tr;
    foreach(col; columns) 
      tr(("classes" in col ? H5Th([col["classes"]], col["title"]) : H5Th(col["title"])));
    return tr;
  } 

    auto rows(string rootPath, STRINGAA[] columns, T[] entities) {
        auto results = H5Tbody;
        foreach(entity; entities) {
            auto row = H5Tr(entity.id.toString, [""]);
            auto json = entity.toJson;
            auto id = entity.id.toString;
            foreach(column; columns) {
                switch(column["key"]) {
                    case "actions":
                        row.td( // Actions
                            H5Div(["btn-list"],
                                H5Span(["d-none d-sm-inline"],
                                    buttonLinkView(rootPath, id),
                                    buttonLinkEdit(rootPath, id),
                                    buttonLinkDelete(rootPath, id)
                                )
                            )
                        );
                        break;

                    case "status":
                        row.td(); // Status
                    break;

                    default:
                        row.td(json[column["key"]].get!string);    
                        break;
                }
            }
            results(row);
        }
        return results;
    }

    return 
      BS5Row(["row-deck row-cards"], 
      BS5Col(["col-12"], 
        BS5Card
          .header( 
            H5H3(["card-title"], "Gefundene "~mainTitle))
          .body_(["border-bottom py-3"],
            H5Div(["d-flex"],
              H5Div(["text-muted"], 
                H5String("Show"),
                H5Div(["mx-2 d-inline-block"],
                  UIMTextInput(["form-control-sm"], ["value":to!string(numberEntities), "size":"3", "aria-label": mainTitle~" count"])), 
                H5String("entries")),
              H5Div(["ms-auto text-muted"], 
                H5String("Search:"),
                H5Div(["ms-2 d-inline-block"], 
                  UIMTextInput(["form-control-sm"], ["aria-label":"Search "~mainTitle.toLower])))
            )
          )
          (
            H5Div(["table-responsive"], 
              BS5Table(["card-table table-vcenter text-nowrap datatable"], 
                H5Thead(
                    header(rootPath, columns)
                ),
                rows(rootPath, columns, entities)
            )))
          .footer(["d-flex align-items-center"], 
            H5P(["m-0 text-muted"], "Showing <span>%s</span> to <span>%s</span> of <span>%s</span> entries".format(startPos, endPos, sumEntities)),
            BS5Pagination(["m-0 ms-auto"])
              .item(["disabled"],
                BS5PageLink(["href":"#", "tabindex":"-1", "aria-disabled":"true"], tablerIcon("chevrons-left")~"Prev"))
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
                BS5PageLink(["href":"#"], "Next"~tablerIcon("chevrons-right"))
              )
          )
      )
    );
}

auto listPageHeader(string rootPath, string preTitle, string title, STRINGAA reqParameters) {
    return
      PageHeader
        .rootPath(rootPath)
        .preTitle(preTitle)
        .title(title)
        .actions([["refresh", "create"]])
      .toH5(reqParameters);
}

