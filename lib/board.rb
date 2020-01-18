class Board
    attr_accessor :cells
    
    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i-1]
    end

    def update(input, player)
        if(valid_move?(input))
            cells[input.to_i-1] = player.token
        end
    end

    def full?
        @cells.include?(" ") == false
    end

    def turn_count
        @cells.find_all{|cell| cell != " "}.length
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        input.to_i > 0 && input.to_i < 9 && taken?(input) == false
    end
end
