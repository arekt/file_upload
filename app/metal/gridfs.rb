# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Gridfs
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/gridfs\/(.+)$/
      fs = Mongo::GridFileSystem.new(MongoMapper.database)
      fs.open($1, 'r') do |file|
        [200, {'Content-Type' => file.content_type}, [file.read]]
      end
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
