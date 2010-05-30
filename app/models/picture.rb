class Picture 
include MongoMapper::Document
plugin Joint

attachment :file
end
