class SunlightInfluenceExplorer
  include HTTParty
  base_uri "http://transparencydata.com/api/1.0"

  def initialize
    @apikey = Rails.application.secrets.sunlight_api_key
  end

  def top_contributors(bioguide_id, cycle, limit = 5)
    entity_id = entity_id_lookup(bioguide_id)
    self.class.get("/aggregates/pol/#{entity_id}/contributors.json", query: {entity_id: entity_id, cycle: cycle, apikey: apikey, limit: limit})
  end

  private

  attr_reader :apikey

  def entity_id_lookup(bioguide_id)
    response = self.class.get("/entities/id_lookup.json", query: {bioguide_id: bioguide_id, apikey: apikey})
    response.first["id"]
  end
end
