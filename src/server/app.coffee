# required modules
_              = require "underscore"
async          = require "async"
http           = require "http"
express        = require "express"
path           = require "path"
methodOverride = require "method-override"
bodyParser     = require "body-parser"
socketio       = require "socket.io"
errorHandler   = require "error-handler"

log       = require "./lib/log"
Generator = require "./lib/Generator"

app       = express()
server    = http.createServer app
io        = socketio.listen server

# collection of client sockets
sockets = []

# create a generator of data
persons = new Generator [ "first", "last", "gender", "birthday", "age", "ssn"]

# distribute data over the websockets
persons.on "data", (data) ->
	data.timestamp = Date.now()
	socket.emit "persons:create", data for socket in sockets

persons.start()

# websocket connection logic
io.on "connection", (socket) ->
	# add socket to client sockets
	sockets.push socket
	log.info "Socket connected, #{sockets.length} client(s) active"

	# disconnect logic
	socket.on "disconnect", ->
		# remove socket from client sockets
		sockets.splice sockets.indexOf(socket), 1
		log.info "Socket disconnected, #{sockets.length} client(s) active"

# express application middleware
app
	.use bodyParser.urlencoded extended: true
	.use bodyParser.json()
	.use methodOverride()
	.use express.static path.resolve __dirname, "../client"

# express application settings
app
	.set "view engine", "jade"
	.set "views", path.resolve __dirname, "./views"
	.set "trust proxy", true

# express application routess
app
	.get "/", (req, res, next) =>
		res.render "main"

# start the server
server.listen 3000
log.info "Listening on 3000"
