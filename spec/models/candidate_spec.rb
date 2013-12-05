# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Candidate do

	# Relationships
  it {should belong_to (:selection_process)}

  it {should have_a_valid_factory}
end
