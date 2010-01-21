File.open(File.join(RAILS_ROOT, 'config/database.mongo.yml'), 'r') do |f|
  @settings = YAML.load(f)[RAILS_ENV]
end

connection = Mongo::Connection.new(@settings["host"])

Mongoid.database = connection.db(@settings["database"])

if @settings["username"]
  Mongoid.database.authenticate(@settings["username"], @settings["password"])
end

# Q: From MongoMapper initializer, needed with Mongiod?
# 
# if defined?(PhusionPassenger)
#   PhusionPassenger.on_event(:starting_worker_process) do |forked|
#     # if using older than 0.6.5 of MM then you want database instead of connection
#     # MongoMapper.database.connect_to_master if forked
#     MongoMapper.connection.connect_to_master if forked
#   end
# end