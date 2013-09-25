# Lab #1: Ruby and CouchDB
# ^^^^^^^^^^^^^^^^^^^^^^^^
# Connor Cunningham
require 'net/http'
require 'couchdb'

module Couch

	class Server #define class for database server
		def initialize(host, port)
			@host = '67.23.79.113' #assign IPV4
			@port = '5984'		   #assign port
		end

		def put(uri, json) #define put method for server
 	       req = Net::HTTP::Put.new(uri)
           req["content-type"] = "application/json"
           req.body = json
           request(req)
        end

        def request(req) #define request method for server
           	res = Net::HTTP.start(@host, @port) { |http|http.request(req) }
           	unless res.kind_of?(Net::HTTPSuccess)
            	handle_error(req, res) #handles request errors
           	end
           	res
        end

		private

		def handle_error(req, res) #error handler
           e = RuntimeError.new("#{res.code}:#{res.message}\nMETHOD:#{req.method}\nURI:#{req.path}\n#{res.body}")
           raise e
        end

    end

end

server = Couch::Server.new("67.23.79.113", "5984") #define new server instance
server.put("/sconnorc/", "") #insert database into server

doc = <<-JSON
{"type":"comment","body":"First Post"}
JSON
server.put("/sconnorc/1245", doc) #inserts JSON document to database








