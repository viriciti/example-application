TableRowView = require "./TableRowView"

class TableView extends Marionette.CompositeView
	template:           require "../templates/table.jade"
	childView:          TableRowView
	childViewContainer: "tbody"

module.exports = TableView