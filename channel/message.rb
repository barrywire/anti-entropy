# require 'json'

# class Message
#     attr_reader :client_id, :handle, :content, :timestamp

#     def self.inflate(json)
#         attributes = JSON.parse(json)
#         new(attributes['client_id'], attributes['handle'], attributes['content'], attributes['timestamp'])
#     end

#     def initialize(client_id, handle, content, timestamp)
#         @client_id = client_id
#         @handle = handle
#         @content = content
#         @timestamp = timestamp
#     end

#     def to_json
#         { client_id: @client_id, handle: @handle, content: @content, timestamp: @timestamp }.to_json
# end

require 'json'

class Message
    attr_reader :client_id, :handle, :content, :timestamp

    def self.inflate(json)
        attributes = JSON.parse(json)
        new(attributes)
    end

    def initialize(attributes={})
        @client_id = attributes.fetch('client_id')
        @handle = attributes.fetch('handle')
        @content = attributes.fetch('content')
        @timestamp = attributes.fetch('timestamp')
    end

    def to_json
        { client_id: @client_id, handle: @handle, content: @content, timestamp: @timestamp }.to_json
    end
    #     { client_id: client_id, handle: handle, content: content, timestamp: timestamp }.to_json
    # end

end
