assert = require "assert"

log = require "../src/server/lib/log"

describe "Tests for `log.coffee`", ->

	describe "existence of sigleton", ->
		it "should exist", ->
			assert log

	describe "existence of info function", ->
		it "should be a function", ->
			assert.equal "function", typeof log.info

	describe "existence of warn function", ->
		it "should be a function", ->
			assert.equal "function", typeof log.warn

	describe "existence of error function", ->
		it "should be a function", ->
			assert.equal "function", typeof log.error

	describe "existence of debug function", ->
		it "should be a function", ->
			assert.equal "function", typeof log.debug

