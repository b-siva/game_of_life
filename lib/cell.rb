#!/usr/bin/env ruby
#######################################################################################
# File: cell.rb                                                                       #
# Author: Sivaprakasam Boopathy                                                       #
# Description:  Sets up cell for each position in graph                               #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
class Cell
  attr_accessor :value, :current_state, :future_state

  def initialize(value)
    @value = value
    set_states
  end

  def alive?
    @current_state == 1
  end

  def dead?
    @current_state == 0
  end

  def set_states
    @current_state = @value
    @future_state = @value
  end
end
