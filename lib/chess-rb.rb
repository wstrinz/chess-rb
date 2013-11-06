require_relative 'chess-rb/piece.rb'
require_relative 'chess-rb/board.rb'
require_relative 'chess-rb/cell.rb'
require_relative 'chess-rb/army.rb'
# require_relative 'chess-rb/armies/base_army/base_army.rb'
Dir[File.dirname(__FILE__) + '/chess-rb/armies/base_army/*.rb'].each {|file| require file }