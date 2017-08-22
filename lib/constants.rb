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
