module uim.apps.scripts.entities.list;

@safe:
import uim.apps;

private:
auto myApi = "/api/v1/grundschutz/informations";
auto myUrl = "/structure/informations";

auto listEntities() {  
 return
  jsLet([
    "entities": "[]",
    "selectAllEntitiesValue": "''",
    "sortCol":"''",
    "sortDir":"0",
    "sortDirName":"0",
    "sortDirDisplay":"0",
    "pageNo": "0"
    ])~

  jsElementById(["viewEntities", "entitiesSearch", "headName", "tableBody",
    "headDisplay", "inputSearch", "btnClearSearch", "cbSelectAllEntities",
    "nameSort", "nameUp", "nameDown", "displaySort", "displayUp", "displayDown",
    "prevEntities", "nextEntities", "pagesEntites", "availableEntites", "pageDisplay", "messages"
    ])~
  
  jsLet([
    "entriesSize":"viewEntities.value"
    ])~

  jsFunc("pageEntities", ["entities", "size", "pageNo"],
    jsIf(jsOr("size==0", "size>=entities.length"), 
      // No pagination
      jsLet("startEntry", "1")~
      jsLet("endEntry", "entities.length")~
      "availableEntites.innerHTML=`Anzeige <span>${startEntry+1}</span> bis <span>${endEntry}</span> von <span>${entities.length}</span> Einträgen`;"~
      "return entities;")~
    // Use pagination
    jsLet("results", "entities")~
    jsLet("pageNumbers", "Math.trunc(entities.length/size)+1")~
    jsLet("pageRest", "entities.length%size")~
    jsIfElse("pageNo===1",
      `prevEntities.classList.add("disabled");`,
      `prevEntities.classList.remove("disabled");`
    )~  
    "pageDisplay.innerText=`Seite ${pageNo+1}`;"~
    jsIfElse("pageNo===pageNumbers+1", 
      `nextEntities.classList.add("disabled");`,
      `nextEntities.classList.remove("disabled");`
    )~
    jsLet("startEntry", "pageNo*size")~
    jsLet("endEntry", "(pageNo+1)*size")~
    jsIf("endEntry>entities.length", "endEntry=entities.length;")~
    "availableEntites.innerHTML=`Anzeige <span>${startEntry+1}</span> bis <span>${endEntry}</span> von <span>${entities.length}</span> Einträgen`;"~
    "return entities.slice(startEntry, endEntry);"
  )~
  // Filter entity 
  jsFunc("filterEntity", ["entity", "filter"],
    jsLet("found", "true")~
    jsForIn("key", "filter",    
      jsIfElse("key in entity", 
        "return filter[key](entity[key]);",
        "return false;",
      ))~
    "return true;")~
  // Filter by name
  jsFunc("filterByName", ["name", "value"], 
    jsIf("name.length===0", "return true")~    
    jsIfElse("value.indexOf(name)>=0",
      "return true;", "return false;"))~
  // Filter by string
  jsFunc("filterByString", ["keyvalue", "value"], 
    jsIf("keyvalue.length===0", "return true")~    
    jsIfElse("value.indexOf(keyvalue)>=0",
      "return true;", "return false;"))~
  // Filter by display
  jsFunc("filterByDisplay", ["display", "value"], 
    jsIf("display.length===0", "return true")~    
    jsIfElse("value.indexOf(display) >= 0",
      "return true;", "return false;"))~
  // Filter entites 
  jsFunc("filterEntities", ["entities", "filter"], 
  jsLet("filteredEntities","[]")~
  jsForEach("entities", jsLambda("entity", 
    jsLet("found", "true")~
    jsIf(
      jsOr(
        "filterNameValue.length>0",
        "filterDisplayValue.length>0",
        "selectAllEntitiesValue.length>0"), 
      jsIf("filterNameValue.length>0", 
        jsIf("entity.name.indexOf(filterNameValue)!==0", "found=false;"))~
      jsIf("filterDisplayValue.length>0", 
        jsIf("entity.display.indexOf(filterDisplayValue)!==0", "found=false;"))~
      jsIf("selectAllEntitiesValue.length>0", 
        jsIfElse(
          jsOr(
            "entity.name.indexOf(selectAllEntitiesValue)>=0", 
            "entity.display.indexOf(selectAllEntitiesValue)>=0", 
            "entity.description.indexOf(selectAllEntitiesValue)>=0"), "found=true;", "found=false;"))
        )~
      jsIf("found", "filteredEntities.push(entity);")))~
  "viewEntities.max=filteredEntities.length;"~
  jsIf("parseInt(viewEntities.value)>filteredEntities.length", "viewEntities.value=filteredEntities.length;")~
  "return filteredEntities;")~

  listing()~
  filtering()~
  searching()~
  paging()~
  sorting();

}

auto filtering(string[] cols = ["name", "display"]) {
  string result;
  result ~= jsLet("filterObj", "{}");
  // Create col-based filter functions
  foreach(col; cols) {
    auto Col = col.capitalize;
    // Variables
    result ~= "filterObj['"~col~"'] = { filterValue : '' };";
    result ~= jsLet("filter"~Col~"Value", "''");
    // DOM Elements
    result ~= jsElementById(["btnClearFilter"~Col, "filter"~Col]);

    // Filter Events
    result ~= jsFunc("doFilter"~Col, ["event"], 
      "filterObj['"~col~"'].filterValue=filter"~Col~".value;"~
      jsLet("filteredEntities", "filterEntities(entities, filterObj)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");
    result ~= jsFunc("doClearFilter"~Col, ["event"], 
      "filter"~Col~".value='';"~
      "filterObj['"~col~"'].filterValue='';"~
      jsLet("filteredEntities", "filterEntities(entities, filterObj)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");

    // Add Events to DOM Elements
    result ~= jsEvent("btnClearFilter"~Col, "'click'", "doClearFilter"~Col);
    result ~= jsEvent("filter"~Col, "'input'", "doFilter"~Col);
  }
  
  // Filter String Value
  result ~= jsFunc("filterString", ["value", "filterValue"], 
    jsIf("filterValue.length===0", // Filtervalue empty?
      "return true")~// No filter value, no filtering
    "return (value.indexOf(filterValue)>=0) ? true : false;"
  );
  // Filter String in Entity
  result ~= jsFunc("filterStringEntity", ["entity", "col", "filterValue"], 
    jsIf("col in entity", 
      "return filterString(entity[col], filterValue);" )~
    "return false;"
  );
  result ~= jsFunc("filterStringEntities", ["entities", "col", "filterValue"], 
    jsLet("results", "[]")~
    jsForEach("entities", "entity", 
      jsIf("filterStringEntity(entity, col, filterValue)",
        "results.push(entity);"))~
    "return results;"
  );
  // Filter Entites
  result ~= jsFunc("filterEntities", ["entities", "filterObj"], 
    jsLet("filteredEntities","entities")~
    jsForIn("col", "filterObj",
      "filteredEntities=filterStringEntities(filteredEntities, col, filterObj[col].filterValue);")~
    "return filteredEntities;");

  return result;
}

auto paging() {
  return 
    jsLet(["maxPages":"1"])~
    jsFunc("goPrevEntities", ["event"], 
      "event.preventDefault();"~
      "pageNo=pageNo-1;"~
      jsIf("pageNo<0", "pageNo=0;")~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));")~

    jsFunc("goNextEntities", ["event"], 
      "event.preventDefault();"~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "pageNo=pageNo+1;"~
      jsIfElse(jsOr("entriesSize>0", "entriesSize>sortedAndFilteredEntities.length"),
        "maxPages=Math.trunc(sortedAndFilteredEntities.length/entriesSize)+1;",
        "maxPages=1;")~  
      jsIf("pageNo>maxPages", "pageNo=maxPages;")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));")~

    jsFunc("doPageEntities", ["event"], 
      "entriesSize=parseInt(viewEntities.value);"~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "pageNo=0;"~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");
}
auto searching() {
  string result;

  result ~= jsEvent("inputSearch", "'input'", "doSearch");
  
  // Search in entity - Every finding increments result
  result ~= jsFunc("searchInEntity", ["entity", "cols", "searchValue"], 
    jsLet("searchRelevance", "0")~
    jsIf("searchValue.length===0", // No search value
      "return 0;")~// 
    jsForEach("cols", "col", // for every column
      jsIf(
        jsAnd("col in entity", "entity[col].indexOf(searchValue)>=0"), // Found
        "searchRelevance++;"))~
    "return searchRelevance;"
  );

  // Search in entity - Every finding increments result
  result ~= jsFunc("searchInEntities", ["entities", "cols", "searchValue"], 
    jsLet("findings", "[]")~
    jsForEach("entities", "entity", // for every entity
      jsLet("searchRelevance", "searchInEntity(entity, cols, searchValue)")~
      jsIf("searchRelevance>0",
        "entity['relevance']=searchRelevance;"~
        "findings.push(entity);"))~
    "return findings;"
  );

  result ~= jsFunc("doSearch", ["event"], 
      "selectAllEntitiesValue = event.target.value;"~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");

  result ~= jsFunc("clearSearch", ["event"], 
    "selectAllEntitiesValue = '';"~
    "inputSearch.value='';"~
    jsLet("filteredEntities", "filterEntities(entities)")~
    jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
    "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");

  return result;
}

auto sorting() {
  string result; 

  result ~= jsLet("sortObj", "{}");
  
  result ~= jsFunc("sortName", ["event"], 
      jsIfElse("sortCol==='name'", 
        "sortDir=sortDir>0?-1:1;",
        "sortCol='name';sortDir=1;")~
      "hideSortButtons(sortButtons);"~
      "showSortButtons(unsortButtons);"~
      "toggleSortButton(sortDir, nameSort, nameUp, nameDown);"~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");

  result ~= jsFunc("sortDisplay", ["event"], 
      jsIfElse("sortCol==='display'", 
        "sortDir=sortDir>0?-1:1;",
        "sortCol='display';sortDir=1;")~
      "hideSortButtons(sortButtons);"~
      "showSortButtons(unsortButtons);"~
      "toggleSortButton(sortDir, displaySort, displayUp, displayDown);"~
      jsLet("filteredEntities", "filterEntities(entities)")~
      jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
      "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");

  return result;
}

auto listing() {
  string result;

  result ~= jsFunc("list", ["path", "entities"], 
      jsLet("items", "''")~
      jsFor("let i=0", "i<entities.length", "i++", 
        "items+=listItem(path, entities[i]);")~
      "return items;");

  result ~= jsFunc("listItem", ["path", "entity"], 
      "return `"~
        BS5ListLink(
          BS5Row(["align-items-center"])
          .col(["col-auto"], BS5Badge("listItemBadge", [""]))
          .col(["text-truncate"], 
            H5A(["text-body d-block"], ["href":"${path}/view?entity_id=${entity.id}"], "${entity.display}"),
            H5Small(["d-block text-muted text-truncate mt-n1"], "${entity.name}"))
          .col(["col-auto"], 
            H5A("listItemFavorite", ["list-group-item-actions"], ["href":"#"], tablerIcon("star")))
        ).toString~"`;");

  return result;
}


version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    auto f = File("../../PUBLIC/js/apps/entities/list.js", "w"); // open for writing
    f.write(listEntities);
}}
