var $hxClasses = $hxClasses || {};
var Hello = $hxClasses["Hello"] = function() {
};
Hello.__name__ = true;
Hello.prototype = {
	say: function() {
		return "hello";
	}
}
var Main = $hxClasses["Main"] = function() { }
Main.__name__ = true;
Main.main = function() {
	Type.resolveClass("module.exports").Hello = Hello;
}
var Type = $hxClasses["Type"] = function() { }
Type.__name__ = true;
Type.resolveClass = function(name) {
	var cl = $hxClasses[name];
	if(cl == null || !cl.__name__) return null;
	return cl;
}
var hx = hx || {}
if(!hx.commonjs) hx.commonjs = {}
hx.commonjs.Export = $hxClasses["hx.commonjs.Export"] = function() { }
hx.commonjs.Export.__name__ = true;
var module = module || {}
module.exports = $hxClasses["module.exports"] = function() { }
module.exports.__name__ = true;
String.__name__ = true;
Array.__name__ = true;
hx.commonjs.Export.initialized = false;
Main.main();
