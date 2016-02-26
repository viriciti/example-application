externals = [
	{ require: "underscore" }
	{ require: "jquery" }
	{ require: "async" }
	{ require: "backbone" }
	{ require: "backbone.marionette" }
	{ require: "socket.io-client" }
	{ require: "backbone.babysitter" }
	{ require: "backbone.wreqr" }
	{ require: "backbone.iobind/dist/backbone.iobind.js" }
	{ require: "backbone.iobind/dist/backbone.iosync.js" }
	{ require: "bootstrap"	 }
]

(require "coffee-project")
	documentation: enabled: false
	forever:       enabled: false
	livereload:    enabled: true
	bundle:        enabled: true, externals: externals
	copy:          enabled: true
	less:          enabled: true
	tests:         enabled: true
	coffee:        enabled: true
	watch:         enabled: true
	nodemon:       enabled: true
	clean:         enabled: true
