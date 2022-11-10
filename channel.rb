require 'channel/message'
require 'channel/client'
require 'channel/window'

class Channel    
    def self.start(handle)
        client = Client.new(handle)
        window = Window.new(client)
        
        @window.start
    end
end
