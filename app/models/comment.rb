# require 'elasticsearch-api'
# require 'json'
require 'hashie'

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, Text

  belongs_to :picture

  after :save, :elastic_index

 def elastic_index
  client = Comment.elastic_client
  client.index  index: 'meetyl-demo', type: 'comment', id: self.id, body: data_to_be_indexed
  end

  def self.get_indexed_comments(picture_id)
    client = elastic_client
    response = client.search index: 'meetyl-demo', type: 'comment', body: { query: { match: { id: picture_id } } }
    mash = Hashie::Mash.new response
    comments_objects = mash.hits.hits.map { |obj| Comment.get(obj['_id'].to_i) }
  end

  def self.elastic_client
    Elasticsearch::Client.new log: true
  end

  def data_to_be_indexed
    # As I understood it from the brief, the data to be indexed should 
    # be the id, title and  description of the picture ( not certain if 
    # I  got that right, but the data to be indexed could easily be 
    # updated in just here)
    picture.to_json(only: [:id, :title, :description])
  end

end

