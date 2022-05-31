class Player 
    attr_reader :name, :player_symbol
    @@player_count = 0
    def initialize(name)
        @name = name
        @@player_count += 1
        if @@player_count == 1
            @player_symbol = "x"
        else
            @player_symbol = "o"
        end
    end
    def get_player
        @@player_count
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
    def get_board
        @@array_tiles
    end
    def instructions
        puts "\n\n------INSTRUCTIONS------\n\n"
        puts "When you are prompted choose the number of the tile as shown below\n\n"
        for i in 0..4
            if i == 0 || i == 2 || i == 4
                for y in 0..4
                    if y == 0 || y == 2 || y == 4
                        if i == 0 && y == 0
                            print " 1 "
                        elsif i == 0 && y == 2
                            print " 2 "
                        elsif i == 0 && y == 4
                            print " 3 "
                        elsif i == 2 && y == 0
                            print " 4 "
                        elsif i == 2 && y == 2
                            print " 5 "
                        elsif i == 2 && y == 4
                            print " 6 "
                        elsif i == 4 && y == 0
                            print " 7 "
                        elsif i == 4 && y == 2
                            print " 8 "
                        elsif i == 4 && y == 4
                            print " 9 "
                        end
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
        puts "------------------------\n\n\n"
    end
end

class Game 
    include Board
    print "Enter player 1's name: "

    player_one = Player.new(gets.chomp)
    puts "Player #{player_one.get_player} name: #{player_one.name}"
    puts player_one.player_symbol

    print "Enter player 2's name: "
    player_two = Player.new(gets.chomp)
    puts "Player #{player_two.get_player} name: #{player_two.name}"
    puts player_two.player_symbol
    @@round = 1
    game_state = true
    tile_chosen = ""
    while game_state
        if (@@round % 2 == 0)
            while !(1..9).include?(tile_chosen)
                print "Player 2's turn, Input which tile you want: "
                tile_chosen = gets.chomp.to_i
                puts tile_chosen
                if !(1..9).include?(tile_chosen)
                    print "Invalid Tile! Input again\n"
                end
            end
        else
            while !(1..9).include?(tile_chosen)
                print "Player 1's turn, Input which tile you want: "
                tile_chosen = gets.chomp.to_i
                puts tile_chosen
                if !(1..9).include?(tile_chosen)
                    print "Invalid Tile! Input again\n"
                else
                    
                end
            end
        end
        @@round += 1
    end
end



g = Game.new
g.instructions
g.create_board
#p g.get_board

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