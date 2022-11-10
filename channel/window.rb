require 'curses'

class Window
    include Curses

    def initialize(client)
        @client = client
        @messages = []
        @cursor = 0
        @scroll = 0
    end

    # def start
    #     init_screen
    #     noecho
    #     curs_set(0)
    #     stdscr.keypad(true)
    #     stdscr.nodelay = true
    #     stdscr.scrollok(true)

    #     @client.add_message_listener(method(:receive_message))

    #     loop do
    #         render
    #         handle_input
    #         sleep(0.05)
    #     end
    # ensure
    #     close_screen
    # end


    def start
        @client.add_message_listener(self)

        loop do
            capture_input
        end

    end

    def new_message(message)
        @messages << message
        redraw
    end

    private

    def capture_input
        content = getstr

        if content == 'q'
            exit
        elsif content.length > 0
            message = @client.transmit(content)
            new_message(message)
        end
    end

    def redraw
        draw_text_field
        draw_messages
        cursor_to_input_line
        refresh
    end
end
