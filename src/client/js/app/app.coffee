_          = require "underscore"
$          = require "jquery"
Backbone   = require "backbone"
Backbone.$ = $
Marionette = require "backbone.marionette"
io         = require "socket.io-client"

window._          = _
window.$          = $
window.jQuery     = $
window.Backbone   = Backbone
window.Marionette = Marionette

require "backbone.babysitter"
require "backbone.wreqr"
require "backbone.iobind/dist/backbone.iobind.js"
require "backbone.iobind/dist/backbone.iosync.js"
require "bootstrap"

# load marionette application
Application = window.Application = require "./Application"

# load application modules
require "./modules/todos"
require "./modules/persons"

# setup connection logic
address  = "http://localhost:3000"
console.log "Connecting to #{address}"
socket = io.connect "#{address}",
	"reconnect":          true
	"reconnection delay": 2000

socket.on "connect", ->
	console.log "Connected"

	Application.start()

	if Backbone.History.started
		route = Backbone.history.fragment or ""
		Backbone.history.loadUrl route
	else
		Backbone.history.start()

window.Application = Application
window.socket      = socket