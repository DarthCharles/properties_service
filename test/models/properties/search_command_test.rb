class Property::SearchCommandTest < ActiveSupport::TestCase

  before do
    @command = Property::SearchCommand
  end

  describe '#call' do
    it 'returns an array of properties within 5km radius' do
      result = @command.call(lng: 13.4058114, lat: 52.530741, property_type: 'apartment', offer_type: 'sell')
      assert result.success?
      assert_equal 2, result.properties.count
    end

    it 'fails and abort if params are missing' do
      result = @command.call(lng: 13.4058114, lat: 52.530741, offer_type: 'sell')
      refute result.success?
      assert_equal [], result.properties
      assert_equal :validation_failed, result.status
      assert_equal 'Looks like some search parameters are missing!', result.message
    end

    it 'fails and abort if no results are found' do
      result = @command.call(lng: 130.4058114, lat: 52.530741, property_type: 'apartment', offer_type: 'sell')
      refute result.success?
      assert_equal [], result.properties
      assert_equal :no_results, result.status
      assert_equal 'Sorry, no results matches your search.', result.message
    end

    it 'rescue any exceptions, log the message and return a nice message' do
      Property.expects(:within).raises(StandardError.new)
      Rails.logger.expects(:error)
      result = @command.call(lng: 130.4058114, lat: 52.530741, property_type: 'apartment', offer_type: 'sell')
      refute result.success?
      assert_equal [], result.properties
      assert_equal :failure, result.status
      assert_equal 'Oops, something went terribly wrong, please contact the Homeday team for assitance!', result.message
    end
  end
end
