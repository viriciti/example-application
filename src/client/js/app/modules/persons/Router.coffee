LayoutView = require "./views/LayoutView"

Module = Application.module "Persons"

class Router extends Backbone.Router
	routes:
		""       : "persons"
		"persons": "persons"

	initialize: ->
		@layoutView = new LayoutView

	persons: ->
		Application.layoutView.getRegion("body").show @layoutView

		Application.triggerRoute "persons"

module.exports = Router
