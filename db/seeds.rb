require 'faker'
require 'factory_girl_rails'
class Seed
  def initialize
    generate_legislators
    generate_contributors
  end

  def generate_legislators
    @degette = FactoryGirl.create(:legislator, party: "D",
      first_name: "Diana",
      last_name: "DeGette",
      middle_name: "L.",
      gender: "F",
      state: "CO",
      title: "Rep",
      chamber: "house")

    @gardner = FactoryGirl.create(:legislator, party: "R",
      first_name: "Cory",
      last_name: "Gardner",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate")

    @bennet = FactoryGirl.create(:legislator, party: "D",
      first_name: "Michael",
      last_name: "Bennet",
      middle_name: "F.",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate")

    puts "legislators generated"
  end

  def generate_contributors
    contributors_for(@degette)
    contributors_for(@gardner)
    contributors_for(@bennet)
    puts "contributors generated"
  end

  def contributors_for(legislator)
    FactoryGirl.create(:contributor, total_amount: 1000.00, employee_amount: 500.00, direct_amount: 500.00, legislator: legislator, cycle: "2014")
    FactoryGirl.create(:contributor, total_amount: 900.00, employee_amount: 300.00, direct_amount: 600.00, legislator: legislator, cycle: "2014")
    FactoryGirl.create(:contributor, total_amount: 750.00, employee_amount: 250.00, direct_amount: 500.00, legislator: legislator, cycle: "2014")
  end
end

Seed.new
