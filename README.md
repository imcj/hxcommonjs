# hxcommonjs

You can use hxcommmonjs export commonjs modules.

    hx.commonjs.Export.set("Hello", "Hello");

parameter 1 is field of exports, and 2 is class name.

    // JS

    var example = require("example.js");
    var hello = new example.Hello();
    console.log(hello.say());

    // got "hello"