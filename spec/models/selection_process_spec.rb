# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SelectionProcess do
  it {should have_a_valid_factory}
  before(:each) do 
    #SelectionProcess.any_instance.stub(:save).and_return(true)
    SelectionProcess.any_instance.stub(:save_attached_files).and_return(true)
  end

  it "should add candidate with a valid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate)).should be(true)

    selection.candidates.count.should be == 1
  end

  it "should add candidate with a invalid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate, curriculum: nil)).should be(false)

    selection.candidates.count.should be == 0
  end

  it "should consolidate_process is called" do
    selection = create(:selection_process)
    selection.consolidate_process!

    selection.consolidated.should be == true
  end

end
