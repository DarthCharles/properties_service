require 'test_helper'

class V1::Properties::PropertiesControllerTest < ActionController::TestCase

  it 'returns json response when successful' do
    expected_response = { properties: [{ type: 'apartment', house_number: nil, street: nil, city: 'Berlin', zip_code: '10117', lat: '52.530741', lng: '13.405811', price: '20000.0' }] }
    get :search, params: { lat: 52.530741, lng: 13.4058114, property_type: 'apartment', marketing_type: 'sell' }
    assert_response :success
    assert_equal expected_response.to_json, @response.body
  end

  it 'returns json when no results found' do
    expected_response = { properties: [], message: 'Sorry, no results matches your search.' }
    get :search, params: { lat: 13.4236807, lng: 52.5342963, property_type: 'apartment', marketing_type: 'sell' }
    assert_response :success
    assert_equal expected_response.to_json, @response.body
  end

  it 'returns unprocessable_entity when search is blank' do
    expected_response = { properties: [], message: 'Looks like some search parameters are missing!' }
    get :search, params: { lat: nil, lng: nil }
    assert_response :unprocessable_entity
    assert_equal expected_response.to_json, @response.body
  end

  it 'returns internal_server_error when something goes really wrong' do
    Property::SearchCommand.stubs(call: stub(status: :fatal, message: 'Oops, something went terribly wrong, please contact the Homeday team for assitance!'))
    expected_response = {properties:[], message: 'Oops, something went terribly wrong, please contact the Homeday team for assitance!'}
    get :search, params: { lat: 13.4236807, lng: 52.5342963, property_type: 'apartment', marketing_type: 'sell' }
    assert_response :internal_server_error
    assert_equal expected_response.to_json, @response.body
  end
end
