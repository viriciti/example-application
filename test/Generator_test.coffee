assert = require "assert"

Generator = require "../src/server/lib/Generator"

generator = null

describe "Tests for `Generator.coffee`", ->

	beforeEach -> generator = new Generator ["age", "first", "name"]
	afterEach  -> generator.removeAllListeners()

	describe "construct", ->
		it "should have types, a chance object and an interval", ->
			assert generator.chance
			assert generator.types
			assert generator.interval

	describe "start", ->
		it "should emit started signal when started", (done) ->
			generator.once "started", -> done()
			generator.start()

		it "should emit data when started", (done) ->
			generator.once "data", -> done()
			generator.start()

		it "should emit up to 10 data messages", (done) ->
			count = 0

			generator.interval = 1
			generator.on "data", -> done() if ++count is 10
			generator.start()

	describe "stop", ->
		it "should send the stopped signal when stopped", (done) ->
			generator.once "stopped", -> done()
			generator.start()
			generator.stop()

		it "should stop emitting data when stopped", (done) ->
			count = 0

			generator.once "stopped", ->
				generator.on "data", ->
					throw new Error "No data should be coming through when stopped!"
				setTimeout done, 100

			generator.interval = 10
			generator.on "data", -> generator.stop() if ++count is 10
			generator.start()

