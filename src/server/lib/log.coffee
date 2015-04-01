winston = require "winston"

level = "info"
level = "debug" if process.env.DEBUG in ["1", "true"]

logger = new winston.Logger
		transports: [
				new winston.transports.Console
					colorize:  true
					level:     level
		]

module.exports = logger
