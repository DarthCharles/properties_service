class Property::SearchCommand
  include AyeCommander::Command

  SEARCH_RADIUS = 5

  receives :lat,
           :lng,
           :property_type,
           :offer_type

  returns :properties, :message

  def call
    validate_params
    search_within_radius
  rescue => e
    @properties = []
    @message    = "Oops, something went terribly wrong, please contact the Homeday team for assitance!"
    Rails.logger.error("[Property::SearchCommand] #{e.message}. #{e.backtrace.first}")
    fail! && abort!
  end

  # Could perfom validation separately, but for time constraints will put them general.
  def validate_params
    if lat.blank? || lng.blank? || property_type.blank? || offer_type.blank?
      @properties = []
      @message    = "Looks like some search parameters are missing!"
      fail!(:validation_failed) && abort!
    end
  end

  def search_within_radius
    @properties = Property
                    .within(SEARCH_RADIUS, origin: [lat, lng])
                    .where(property_type: property_type, offer_type: offer_type)

    if properties.blank?
      @message = "Sorry, no results matches your search."
      fail!(:no_results) && abort!
    end
  end
end