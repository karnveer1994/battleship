class Battleship
  attr_accessor :p1_matrix, :p2_matrix, :total_ships, :p1_ship_positions, :p2_ship_positions, :missiles, :p1_moves, :p2_moves 

  def initialize(file_path)
    get_input(file_path)
  end

  def execute
    place_the_ships(@p1_matrix, p1_ship_positions)
    place_the_ships(@p2_matrix, p2_ship_positions)
    shoot_missiles(@p2_matrix, p1_moves)
    shoot_missiles(@p1_matrix, p2_moves)
  end

  def place_the_ships(matrix, positions)
    positions.each do |position|
      position.each_slice(2) { |x,y| matrix[x][y] = "B" }
    end
  end

  def shoot_missiles(matrix, moves)
    moves.each do |move|
      x, y = move
      case matrix[x][y]
      when "B"
        matrix[x][y] = "X"
      when "_"
        matrix[x][y] = "O"
      end
    end
  end

  def get_input(file_path)
    File.open(file_path, "r") do |file|
      grid_size = file.readline.to_i
      @p1_matrix = get_matrix(grid_size)
      @p2_matrix = get_matrix(grid_size)
      @total_ships = file.readline.to_i
      @p1_ship_positions = get_positions(file)
      @p2_ship_positions = get_positions(file)
      @missiles = file.readline.to_i
      @p1_moves = get_moves(file)
      @p2_moves = get_moves(file)
    end
  end

  def get_matrix(grid_size)
    Array.new(grid_size) { Array.new(grid_size, "_") }
  end

  def get_positions(file)
    file.readline.chomp.split(':').map { |pos| pos.split(',').map(&:to_i) }
  end

  def get_moves(file)
    file.readline.chomp.split(':').map { |move| move.split(',').map(&:to_i) }
  end
end

battleship = Battleship.new('input.txt')
battleship.execute