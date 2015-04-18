LayoutView = require "./views/LayoutView"

class Router extends Backbone.Router
	routes:
		"todos": "todos"

	todos: ->
		Application.layoutView.getRegion("body").show new LayoutView
		Application.triggerRoute "todos"

module.exports = Router
