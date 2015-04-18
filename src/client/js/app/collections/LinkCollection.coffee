class LinkCollection extends Backbone.Collection
	initialize: ->
		@listenTo Application, "route", @routeChanged

	routeChanged: (route) =>
		@each (link) ->
			link.set "active", route is link.get "route"

module.exports = LinkCollection