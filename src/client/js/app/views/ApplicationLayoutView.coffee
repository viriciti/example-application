class ApplicationLayoutView extends Marionette.LayoutView
	template: require "../templates/layout.jade"

	regions:
		navigation: ".navigation-container"
		body:       ".body-container"

module.exports = ApplicationLayoutView
