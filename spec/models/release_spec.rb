# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Release do
  it {should belong_to :cashier}
  it {should have_a_valid_factory}
end
