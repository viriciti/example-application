class LayoutView extends Marionette.LayoutView
	template: require "../templates/layout.jade"
	regions:
		content: ".todo-container"

module.exports = LayoutView