module uim.apps.modules;

@safe:
import uim.apps;

void modules(HTTPServerRequest req, HTTPServerResponse res) { 
	string content = `import App from '/`~req.params["source"].replace("_", "/")~`/`~req.params["file"].replace("_", ".")~`';new Vue({render: h => h(App),}).$mount('#app');`;
	res.writeBody(content, "text/javascript");
}
