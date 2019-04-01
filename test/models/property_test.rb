require 'test_helper'

class PropertyTest < ActiveSupport::TestCase

  it 'creates a new property' do
    property = Property.new(
      offer_type:    'sell',
      property_type: 'apartment',
      zip_code:      10405,
      city:          'Berlin',
      street:        'Marienburger Straße',
      house_number:  31,
      lat:           13.4211476,
      lng:           52.534993,
      price:         350000
    )

    assert property.valid?
  end

  it 'returns validation error if zip_code or city are missing' do
    property = Property.new(
      offer_type:    'sell',
      property_type: 'apartment',
      street:        'Marienburger Straße',
      house_number:  31,
      lat:           13.4211476,
      lng:           52.534993,
      price:         350000
    )

    refute property.valid?
    assert_equal 'City can\'t be blank and Zip code can\'t be blank', property.errors.full_messages.to_sentence
  end

end