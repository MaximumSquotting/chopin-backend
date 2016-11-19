require 'rails_helper'

RSpec.describe Offer, type: :model do
  %i( name cost_per_person max_number_of_people ).each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end

  %i( cost_per_person max_number_of_people ).each do |attribute|
    it { is_expected.to validate_numericality_of(attribute).only_integer.is_greater_than_or_equal_to(1) }
  end
end
