class Player 
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

module Board
    @@array_tiles = Array.new(5, Array.new(5,"   "))
    def create_board
        for i in 0..4
            if i == 0 || i == 2 || i == 4
                for y in 0..4
                    if y == 0 || y == 2 || y == 4
                        print "#{@@array_tiles[i][y]}"
                    elsif y == 1
                        print "|"
                    elsif y == 3
                        print "|"
                    end
                end
                print "\n"
            elsif i == 1 || i == 3 
                for x in 0..4
                    if x == 0 || x == 2 || x == 4
                        print "---"
                    else
                        print "+"
                    end
                end
                print "\n"
            end
        end
    end
end

class Game 
    include Board
    print "Enter player 1's name: "
    player_one = Player.new(gets.chomp)
    puts "Player one's name: #{player_one.name}"

    print "Enter player 2's name: "
    player_two = Player.new(gets.chomp)
    puts "Player two's name: #{player_two.name}"
end



g = Game.new
g.create_board
=begin
   def create_game
for i in 0..4
    if i == 0 || i == 2 || i == 4
        for y in 0..4
            if y == 0 || y == 2 || y == 4
                print "#{@@array_tiles[i][y]}"
            elsif y == 1
                print "|"
            elsif y == 3
                print "|"
            end
        end
        print "\n"
    elsif i == 1 || i == 3 
        for x in 0..4
            if x == 0 || x == 2 || x == 4
                print "---"
            else
                print "+"
            end
        end
        print "\n"
    end
end
end
=end