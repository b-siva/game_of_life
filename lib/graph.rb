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
    @graph.each_with_index do |row, i|
      row.each_with_index do |col, j|
        case state
        when 'initial'
          @graph[i][j] = Cell.new(@graph[i][j])
        when 'final'
          @graph[i][j] = @graph[i][j].current_state
        when 'new'
          @graph[i][j].current_state = @graph[i][j].future_state
        end
      end
    end
  end

  #iterate for n times for state change
  def iterate_n_times
    i = ZERO
    while i < @iterations do
      iterate
      state_change('new')
      i += ONE
    end
  end

  # iterate each location
  def iterate
    @graph.each_with_index do |row, i|
      row.each_with_index do |col, j|
        live_neighbors = evaluate_neighbours(i,j)
        if @graph[i][j].dead? && live_neighbors == THREE
          @graph[i][j].future_state = ONE
        elsif live_neighbors < TWO || live_neighbors > THREE
          @graph[i][j].future_state = ZERO
        end
      end
    end
  end

  #look all neighbours
  def evaluate_neighbours(i, j)
    count = ZERO
    NEIGHBOURS.each do |location|
      row = location.first + i
      col = location.last + j
      count += ONE if is_safe?(row,col) && @graph[row][col].alive?
    end
    count
  end

  # Row and Col safty check for lookup
  def is_safe?(i,j)
    i >= ZERO && i < @graph.length && j >= ZERO && j < @graph[i].length
  end
end
