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
    @@array_tiles = Array.new(5) {Array.new(5, "   ")}
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
    def get_board_coordinates(x,y)
        @@array_tiles[x][y]
    end
    def set_board(value,x ,y)
        @@array_tiles[x][y]=value
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
    def get_round
        @@round
    end
    def iterate_round
        @@round +=1 
    end
    def player_input(player_chosen, tile_chosen)
        if (tile_chosen == 1)
            if get_board_coordinates(0, 0) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 0, 0)
            end
        elsif (tile_chosen == 2)
            if get_board_coordinates(0, 2) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 0, 2)
            end
        elsif (tile_chosen == 3)
            if get_board_coordinates(0, 4) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 0, 4)
            end
        elsif (tile_chosen == 4)
            if get_board_coordinates(2, 0) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 2, 0)
            end
        elsif (tile_chosen == 5)
            if get_board_coordinates(2, 2) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 2, 2)
            end
        elsif (tile_chosen == 6)
            if get_board_coordinates(2, 4) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 2, 4)
            end
        elsif (tile_chosen == 7)
            if get_board_coordinates(4, 0) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 4, 0)
            end
        elsif (tile_chosen == 8)
            if get_board_coordinates(4, 2) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 4, 2)
            end  
        elsif (tile_chosen == 9)
            if get_board_coordinates(4, 4) != "   "
                puts "Tile already Taken!"
            else
                set_board(" #{player_chosen} ", 4, 4)
            end
        end
    end
    def check_winner
        if get_board_coordinates(0,0) == " x " && get_board_coordinates(0,2) == " x " && get_board_coordinates(0,4) == " x " #123
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,0) == " o " && get_board_coordinates(0,2) == " o " && get_board_coordinates(0,4) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(2,0) == " x " && get_board_coordinates(2,2) == " x " && get_board_coordinates(2,4) == " x " #456
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(2,0) == " o " && get_board_coordinates(2,2) == " o " && get_board_coordinates(2,4) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(4,0) == " x " && get_board_coordinates(4,2) == " x " && get_board_coordinates(4,4) == " x " #789
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(4,0) == " o " && get_board_coordinates(4,2) == " o " && get_board_coordinates(4,4) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(0,0) == " x " && get_board_coordinates(2,0) == " x " && get_board_coordinates(4,0) == " x " #147
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,0) == " o " && get_board_coordinates(2,0) == " o " && get_board_coordinates(4,0) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(0,2) == " x " && get_board_coordinates(2,2) == " x " && get_board_coordinates(4,2) == " x " #258
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,2) == " o " && get_board_coordinates(2,2) == " o " && get_board_coordinates(4,2) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(0,4) == " x " && get_board_coordinates(2,4) == " x " && get_board_coordinates(4,4) == " x " #369
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,4) == " o " && get_board_coordinates(2,4) == " o " && get_board_coordinates(4,4) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(0,0) == " x " && get_board_coordinates(2,2) == " x " && get_board_coordinates(4,4) == " x " #159
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,0) == " o " && get_board_coordinates(2,2) == " o " && get_board_coordinates(4,4) == " o "
            puts "Player two has won!"
            return true
        elsif get_board_coordinates(0,4) == " x " && get_board_coordinates(2,2) == " x " && get_board_coordinates(4,0) == " x " #357
            puts "Player one has won!"
            return true
        elsif get_board_coordinates(0,4) == " o " && get_board_coordinates(2,2) == " o " && get_board_coordinates(4,0) == " o "
            puts "Player two has won!"
            return true
        end
    end

end


g = Game.new
g.instructions
g.create_board
game_state = true
tile_chosen = ""
while game_state
    
    valid_choice = false
    if (g.get_round % 2 == 0)
        while valid_choice == false
            print "Player 2's turn, Input which tile you want: "
            tile_chosen = gets.chomp.to_i
            puts tile_chosen
            if !(1..9).include?(tile_chosen)
                print "Invalid Tile! Input again\n"
            else
                valid_choice = true
                g.player_input("o", tile_chosen)
            end
        end
    else
        while valid_choice == false
            print "Player 1's turn, Input which tile you want: "
            tile_chosen = gets.chomp.to_i
            if !(1..9).include?(tile_chosen)
                print "Invalid Tile! Input again\n"
            else
                valid_choice = true 
                g.player_input("x", tile_chosen)
            end
        end
    end
    g.iterate_round
    g.create_board
    if g.check_winner
        game_state = false
    end 
    

end
=begin
            if ((get_board_coordinates(0, 0) && get_board_coordinates(0, 2) && get_board_coordinates(0, 4) == " x ") ||
            (get_board_coordinates(0, 0) && get_board_coordinates(0, 2) && get_board_coordinates(0, 4) == " o "))
            if get_board_coordinates(0,0) == " x "
                puts "player one has won"
                return true
            else
                puts "player two has won"
                return true
            end
        elsif ((get_board_coordinates(2, 0) && get_board_coordinates(2, 2) && get_board_coordinates(2, 4) == " x ") ||
            (get_board_coordinates(2, 0) && get_board_coordinates(2, 2) && get_board_coordinates(2, 4) == " o "))
            if get_board_coordinates(2,0) == " x "
                puts "player one has won"
                return true
            else
                puts "player two has won"
                return true
            end
        elsif ((get_board_coordinates(4, 0) && get_board_coordinates(4, 2) && get_board_coordinates(4, 4) == " x ") ||
            (get_board_coordinates(4, 0) && get_board_coordinates(4, 2) && get_board_coordinates(4, 4) == " o "))
            if get_board_coordinates(4,0) == " x "
                puts "player one has won"
                return true
            else
                puts "player two has won"
                return true
            end
        elsif ((get_board_coordinates(0, 0) && get_board_coordinates(1, 0) && get_board_coordinates(1, 0) == " x ") ||
            (get_board_coordinates(0, 0) && get_board_coordinates(1, 0) && get_board_coordinates(1, 0) == " o "))
            if get_board_coordinates(0,0) == " x "
                puts "player one has won"
                return true
            else
                puts "player two has won"
                return true
            end
        end
rescue => exception
    
=end