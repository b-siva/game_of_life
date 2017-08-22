#!/usr/bin/env ruby
#######################################################################################
# File: constants_spec.rb                                                             #
# Author: Sivaprakasam Boopathy                                                       #
# Description: This is spec for constants                                             #
# Date Created: 08/21/2017                                                            #
# Date Updated: 08/21/2017                                                            #
#######################################################################################
require_relative '../lib/constants'

describe Constants do
  it 'should return constant ZERO' do
    expect(Constants::ZERO).to eql(0)
  end

  it 'should return constant ONE' do
    expect(Constants::ONE).to eql(1)
  end

  it 'should return constant THREE' do
    expect(Constants::THREE).to eql(3)
  end

  context 'NEIGHBOURS' do
    it 'should be instance of Array' do
      expect(Constants::NEIGHBOURS).to be_instance_of(Array)
    end

    it 'should return its length as 8' do
      expect(Constants::NEIGHBOURS.length).to eql(8)
    end

    it 'should return first item as Array' do
      expect(Constants::NEIGHBOURS.first).to be_instance_of(Array)
    end
  end
end
