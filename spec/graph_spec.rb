#!/usr/bin/env ruby
#######################################################################################
# File: graph_spec.rb                                                                 #
# Author: Sivaprakasam Boopathy                                                       #
# Description: Spec for graph                                                         #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require_relative '../lib/graph'

describe Graph do

  let(:seed) {
    [
      [1,0,1,0,1],
      [0,1,0,1,1],
      [1,1,1,0,1],
      [0,0,0,0,1],
      [1,0,1,0,1],
      [0,0,0,0,0],
      [0,0,0]
    ]
  }

  let(:num_of_iterations) { 1 }

  let(:graph) { Graph.new(seed, num_of_iterations)}

  let(:game_of_life) { graph.game_of_life }

  context "graph instance" do
    it 'should be instance of Graph object' do
      expect(graph).to be_instance_of(Graph)
    end

    it 'should setup graph instance variable' do
      expect(graph.graph).to be_kind_of(Array)
    end

    it 'should setup iterations instance variable' do
      expect(graph.iterations).to be_kind_of(Fixnum)
    end
  end

  context "Live cell Rules in final state" do
    it "should kill live cell when it has zero neighbour live cell" do
      expect(game_of_life[4][2]).to eql(0)
    end

    it "should kill live cell when it has one neighbour live cell" do
      expect(game_of_life[0][0]).to eql(0)
    end

    it "should kill live cell when it has more than three neighbour live cell" do
      expect(game_of_life[1][1]).to eql(0)
    end

    it "should not kill live cell when it has two neighbour live cell" do
      expect(game_of_life[0][2]).to eql(1)
    end

    it "should not kill live cell when it has three neighbour live cell" do
      expect(game_of_life[2][1]).to eql(1)
    end
  end

  context "Dead cell Rules in final state" do
    it "should stay as dead cell when it has zero neighbour live cell" do
      expect(game_of_life[6][1]).to eql(0)
    end

    it "should stay as dead cell when it has one neighbour live cell" do
      expect(game_of_life[5][0]).to eql(0)
    end

    it "should stay as dead cell when it has two neighbour live cell" do
      expect(game_of_life[5][3]).to eql(0)
    end

    it "should stay as dead cell when it has more than three neighbour live cell" do
      expect(game_of_life[0][3]).to eql(0)
    end

    it "should bring live cell when it has three neighbour live cell" do
      expect(game_of_life[0][1]).to eql(1)
    end
  end

  context "final state" do
    it "should match expected array" do
      expected_array = [
        [0, 1, 1, 0, 1],
        [0, 0, 0, 0, 1],
        [1, 1, 1, 0, 1],
        [1, 0, 1, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0]
      ]
      expect(game_of_life).to match_array(expected_array)
    end
  end
end
