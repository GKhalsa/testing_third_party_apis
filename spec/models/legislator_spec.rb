require "rails_helper"

describe Legislator do
  it "filters based on 'gender'" do
    VCR.use_cassette("legislator#find_by") do
      legislators = Legislator.find_by(gender: "F")
      legislator = legislators.first

      expect(legislators.count).to eq(20)
      expect(legislator.first_name).to eq("Joni")
      expect(legislator.last_name).to eq("Ernst")
    end
  end
end
