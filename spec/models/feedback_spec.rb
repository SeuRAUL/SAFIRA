# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Feedback do
  
  # Relationships
  it {should belong_to (:process_step)}
  it {should belong_to (:candidate)}
  
  it {should have_a_valid_factory}

end
