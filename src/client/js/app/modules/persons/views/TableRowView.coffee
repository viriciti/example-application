class TableRowView extends Marionette.ItemView

	tagName:     "tr"
	modelEvents: change: "render"
	template:    require "../templates/tablerow.jade"

	events:
		"click button": "buttonClicked"

	attributes: ->
		classString = ""

		age = @model.get "age"

		classString = "info"    if age > 50
		classString = "warning" if age > 65
		classString = "danger"  if age > 85

		class: classString

	buttonClicked: ->
		@model.destroy()

	render: ->
		@model.get "hide"
		if @model.get "hide"
			@$el.css "display", "none"
		else
			@$el.css "display", "table-row"
		super

module.exports = TableRowView