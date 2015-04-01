PersonsCollection = require "../collections/PersonsCollection"
ControlsView      = require "./ControlsView"
TableView         = require "./TableView"

class PersonsView extends Marionette.LayoutView

	template: require "../templates/persons.jade"

	regions:
		controls: ".persons-controls"
		table:    ".persons-table"

	initialize: ->
		controlsModel     = new Backbone.Model defaults: pause: false
		personsCollection = new PersonsCollection controls: controlsModel

		@controlsView = new ControlsView model: controlsModel
		@tableView    = new TableView collection: personsCollection


	onBeforeShow: ->
		@getRegion("controls").show @controlsView
		@getRegion("table").show @tableView

module.exports = PersonsView