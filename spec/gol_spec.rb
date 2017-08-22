#!/usr/bin/env ruby
#######################################################################################
# File: constants_spec.rb                                                             #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is spec for constants                                             #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require_relative '../gol'

describe Gol do

  let(:seed) {
    [
      [1,0,1,0,1],
      [0,1,1,0,1],
      [1,1,1,0,1]
    ]
  }

  let(:num_of_iterations) { 5 }

  let(:expected_state) {
    [
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,0,0]
    ]
  }

  context "#test_game: When invalid input" do
    it 'seed should return message "Seed must be 2d array"' do
      seed = 'string'
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to eql('Seed must be 2d array')
    end

    it 'expected_state should return message "Expected state must be 2d array"' do
      expected_state = 'string'
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to eql('Expected state must be 2d array')
    end

    it 'num_of_iterations should return message "Number of iterations must be Integer(Fixnum)"' do
      num_of_iterations = 'string'
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to eql('Number of iterations must be Integer(Fixnum)')
    end
  end

  context "#test_game: When valid input" do
    it 'should return true for seed and expected_state are same' do
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to be_truthy
    end

    it 'should return false for seed and expected_state are not same' do
      num_of_iterations = 2
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to be_falsey
    end

    it 'should return true for NXM matrix for seed and expected_state are same ' do
      seed = [[1,0,1,0,1], [0,1,1], [1,1,1,0,1]]
      expected_state = [[0,0,1,1,0], [0,0,0], [1,0,1,1,0]]
      num_of_iterations = 1
      expect(Gol.test_game(seed, num_of_iterations, expected_state)).to be_truthy
    end
  end
end
