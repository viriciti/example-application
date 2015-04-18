PersonsView = require "./PersonsView"

class LayoutView extends Marionette.LayoutView
	template: require "../templates/layout.jade"

	regions:
		content: ".persons-container"

	onBeforeShow: ->
		@getRegion("content").show new PersonsView

module.exports = LayoutView