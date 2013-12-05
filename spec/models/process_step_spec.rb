# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ProcessStep do
  it {should belong_to :selection_process}

  it {should have_many :feedbacks}

  it {should have_a_valid_factory}

  describe '#consolidate_step!' do

    it 'should consolidate_step! is called' do
    
    end    

  end

  describe '#get_next_step' do
  end

  describe '#approved_candidates' do
  end

  describe '#delayed?' do
  end

end
