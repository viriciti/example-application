class NavigationView extends Marionette.ItemView
	template:           require "../templates/navigation.jade"

	initialize: ->
		@listenTo @collection, "change", @render

module.exports = NavigationView
