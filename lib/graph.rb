#!/usr/bin/env ruby
#######################################################################################
# File: graph.rb                                                                      #
# Author: Sivaprakasam Boopathy                                                       #
# Description:  Sets up graph and navigates the cell                                  #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require './lib/cell'
require './lib/constants'

class Graph
  attr_accessor :graph, :iterations
  include Constants

  def initialize(graph, iterations)
    @graph = graph
    @iterations = iterations
  end

  def game_of_life
    state_change('initial')
    print_current_state
    iterate_n_times
    state_change('final')
    @graph
  end

  private

  # graph goes through three state changes
  # initial => This will initiate the graph with cell
  # final => This tranpose graph back to original with final state
  # new => This puts the graph in new state after each lookup completed on entire graph location
  def state_change(state)
    @graph.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        case state
        when 'initial'
          @graph[row_index][col_index] = Cell.new(@graph[row_index][col_index])
        when 'final'
          @graph[row_index][col_index] = @graph[row_index][col_index].current_state
        when 'new'
          @graph[row_index][col_index].current_state = @graph[row_index][col_index].future_state
        end
      end
    end
  end

  #iterate for n times for state change
  def iterate_n_times
    num_of_times = ZERO
    while num_of_times < @iterations do
      iterate
      state_change('new')
      print_current_state
      num_of_times += ONE
    end
  end

  # iterate each location
  def iterate
    @graph.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        live_neighbors = evaluate_neighbours(row_index,col_index)
        if @graph[row_index][col_index].dead? && live_neighbors == THREE
          @graph[row_index][col_index].future_state = ONE
        elsif live_neighbors < TWO || live_neighbors > THREE
          @graph[row_index][col_index].future_state = ZERO
        end
      end
    end
  end

  #look all neighbours
  def evaluate_neighbours(row_index, col_index)
    count = ZERO
    NEIGHBOURS.each do |location|
      row = location.first + row_index
      col = location.last + col_index
      count += ONE if is_safe?(row,col) && @graph[row][col].alive?
    end
    count
  end

  # Row and Col safty check for lookup
  def is_safe?(row_index,col_index)
    row_index >= ZERO && row_index < @graph.length && col_index >= ZERO && col_index < @graph[row_index].length
  end

  # Print current state in each iteration
  # TODO - private method for now, make it public if it needs accessed outside
  def print_current_state
    puts "\nCurrent State:"
    puts "---------------"
    @graph.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        # This check takes care if it's called before and after Cell class conversion
        print @graph[row_index][col_index].is_a?(Cell) ? @graph[row_index][col_index].current_state : @graph[row_index][col_index]
      end
      puts
    end
  end
end
