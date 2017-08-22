#!/usr/bin/env ruby
#######################################################################################
# File: cell_spec.rb                                                                  #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is spec for cell                                                  #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require_relative '../lib/cell'

describe Cell do
  context "Cell is alive" do
    let(:cell) { Cell.new(1) }

    it 'should set current state' do
      expect(cell.current_state).to eql(1)
    end

    it 'should set future state' do
      expect(cell.future_state).to eql(1)
    end

    it 'should return true for alive?' do
      expect(cell.alive?).to be_truthy
    end

    it 'should return false for dead?' do
      expect(cell.dead?).to be_falsey
    end
  end

  context "Cell is dead" do
    let(:cell) { Cell.new(0) }

    it 'should set current state' do
      expect(cell.current_state).to eql(0)
    end

    it 'should set future state' do
      expect(cell.future_state).to eql(0)
    end

    it 'should return true for alive?' do
      expect(cell.alive?).to be_falsey
    end

    it 'should return false for dead?' do
      expect(cell.dead?).to be_truthy
    end
  end
end
