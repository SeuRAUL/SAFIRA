# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Cashier do

  it {should belong_to :enterprise}

  it {should have_many :releases}

  it {should have_a_valid_factory}

end
