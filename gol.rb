#!/usr/bin/env ruby
#######################################################################################
# File: gol.rb                                                                        #
# Author: Sivaprakasam Boopathy                                                       #
# Description:  Game of life main file to test the application                        #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require './lib/graph'

class Gol

  def self.test_game(seed, num_of_iterations, expected_state)
    unless seed.is_a?(Array) && seed.all? { |elem| elem.is_a? Array }
      return "Seed must be 2d array"
    end

    unless expected_state.is_a?(Array) && expected_state.all? { |elem| elem.is_a?(Array) }
      return "Expected state must be 2d array"
    end

    unless num_of_iterations.is_a?(Fixnum)
      return "Number of iterations must be Integer(Fixnum)"
    end

    Graph.new(seed, num_of_iterations).game_of_life == expected_state
  end

end

# seed, iteration and expected state
# Please change this with your input
seed = [
  [1,0,1,0,1],
  [0,1,1,0,1],
  [1,1,1,0,1]
]

expected_state = [
  [0,0,0,0,0],
  [0,0,0,0,0],
  [0,0,0,0,0]
]

num_of_iterations = 5

# Test values for NXM matrix
# seed = [[1,0,1,0,1], [0,1,1], [1,1,1,0,1]]
# expected_state = [[0,0,1,1,0], [0,0,0], [1,0,1,1,0]]
# num_of_iterations = 1

# prints
# true - if seed and expected_state are same
# flase - if seed and expected_state are not same
puts Gol.test_game(seed, num_of_iterations, expected_state)
