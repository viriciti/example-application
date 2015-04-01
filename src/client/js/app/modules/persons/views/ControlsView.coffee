class ControlsView extends Marionette.ItemView

	template: require "../templates/controls.jade"

	modelEvents:
		"change": "render"

	events:
		"click button.pause": "pauseButtonClicked"

	pauseButtonClicked: ->
		@model.set "pause", !@model.get "pause"

module.exports = ControlsView