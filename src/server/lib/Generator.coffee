_                = require "underscore"
Chance           = require "chance"
{ EventEmitter } = require "events"

log = require "./log"

class Generator extends EventEmitter

	chance:   null
	timeout:  null
	interval: 1000
	running:  false

	constructor: ( @types ) ->
		super

		@chance = new Chance

	start: ->
		@running = true

		@emitData()

		@emit "started"

	stop: ->
		@running = false

		clearTimeout @timeout

		@emit "stopped"

	emitData: =>
		clearTimeout @timeout

		return unless @running

		data = _.chain @types
			.map (type) => [type, @chance[type]() if @chance[type]]
			.object()
			.value()

		@emit "data", data

		@timeout = setTimeout @emitData, @interval


module.exports = Generator
