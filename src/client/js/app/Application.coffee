ApplicationLayoutView = require "./views/ApplicationLayoutView"
NavigationView        = require "./views/NavigationView"

Application = new Marionette.Application
	container: "#application"

Application.triggerRoute = (route, args...) ->
	@trigger "route", route, args...
	@trigger "route:#{route}", args...

Application.addInitializer ->
	@addRegions
		applicationRegion: "#application"

	@layoutView = new ApplicationLayoutView

	@navigationView = new NavigationView

	@applicationRegion.show @layoutView

	@layoutView.navigation.show @navigationView

module.exports = Application
