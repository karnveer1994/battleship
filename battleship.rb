class Battleship
  attr_accessor :grid_size, :total_ships, :p1_ship_positions, :p2_ship_positions, :missiles, :p1_moves, :p2_moves 

  def initialize(file_path)
    get_input(file_path)
  end

  def get_input(file_path)
    File.open(file_path, "r") do |file|
      @grid_size = file.readline.to_i
      @total_ships = file.readline.to_i
      @p1_ship_positions = get_positions(file)
      @p2_ship_positions = get_positions(file)
      @missiles = file.readline.to_i
      @p1_moves = get_moves(file)
      @p2_moves = get_moves(file)
    end
  end

  def get_positions(file)
    file.readline.chomp.split(':').map { |pos| pos.split(',').map(&:to_i) }
  end

  def get_moves(file)
    file.readline.chomp.split(':').map { |move| move.split(',').map(&:to_i) }
  end
end

battleship = Battleship.new('input.txt')