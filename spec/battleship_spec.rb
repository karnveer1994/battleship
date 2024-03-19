require_relative '../battleship'

RSpec.describe Battleship do
  let(:input_file_path) { 'input.txt' }

  describe '#execute' do
    it 'execute the battleship game correctly' do
      battleship = Battleship.new(input_file_path)
      battleship.execute
      output = File.read('output.txt')
      expected_output = <<~OUTPUT
        Player1
        O O _ _ _
        _ X _ _ _
        B _ _ X _
        _ _ _ _ B
        _ _ _ X _

        Player2
        _ X _ _ _
        _ _ _ _ _
        _ _ _ X _
        B O _ _ B
        _ X _ O _

        P1:3
        P2:3
        It is a draw
      OUTPUT

      expect(output).to eq(expected_output)
    end
  end
end
