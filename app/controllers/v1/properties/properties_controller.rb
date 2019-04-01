class V1::Properties::PropertiesController < ApplicationController

  def search
    command = Property::SearchCommand.call(**property_params)

    case command.status
    when :success
      render json: { properties: command.properties.as_json }, status: :ok
    when :no_results
      render json: { properties: [], message: command.message }, status: :ok
    when :validation_failed
      render json: { properties: [], message: command.message }, status: :unprocessable_entity
    else
      render json: { properties: [], message: command.message }, status: :internal_server_error
    end

  end

  private

  def property_params
    {
      property_type: params[:property_type],
      offer_type:    params[:marketing_type],
      lat:           params[:lat],
      lng:           params[:lng]
    }
  end
end
