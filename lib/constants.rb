#!/usr/bin/env ruby
#######################################################################################
# File: constants.rb                                                                  #
# Author: Sivaprakasam Boopathy                                                       #
# Description:  All constants                                                         #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
module Constants
  ZERO = 0
  ONE = 1
  TWO = 2
  THREE = 3
  NEIGHBOURS = [
    [0,-1], [0,1], [-1,0], [-1,-1], [-1, 1], [1,0], [1, -1], [1,1]
  ]
end

# def initial_state
#       @graph.each_with_index do |row, i|
#         row.each_with_index do |col, j|
#           @graph[i][j] = Cell.new(@graph[i][j])
#         end
#       end
#     end

#     def final_state
#        @graph.each_with_index do |row, i|
#         row.each_with_index do |col, j|
#           @graph[i][j] = @graph[i][j].current_state
#         end
#       end
#     end

#     def new_state
#       @graph.each_with_index do |row, i|
#         row.each_with_index do |col, j|
#           @graph[i][j].current_state = @graph[i][j].future_state
#         end
#       end
#     end
# def print_values
#     @graph.each_with_index do |row, i|
#       row.each_with_index do |col, j|
#         print @graph[i][j]
#         print " "
#       end
#       puts
#     end
#   end
