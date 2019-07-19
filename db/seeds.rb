require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create(username: "siobhan", password: "siobhan", password_confirmation: "siobhan", pref_categories: "Creative+%26+Design|Data+Science|Engineering|Project+%26+Product+Management", pref_levels: "Senior+Level|Mid+Level", pref_locations: "Boston%2C+NY|New+York%2C+NY|San+Francisco%2C+CA")


### function: get job data => save company, save job

def job_data
  fetch_data('https://www.themuse.com/api/public/jobs?&category=Engineering&category=Project+%26+Product+Management&level=Mid+Level&level=Entry+Level&location=Boston%2C+MA&location=New+York%2C+NY&location=San+Francisco%2C+CA&page=1&descending=true')["results"]
end



### helper functions:
### fetch company data and save company

### fetch data from theMuse API endpoint

def fetch_data(api_url)
  JSON.parse(RestClient.get(api_url))
end

def get_company(museid)
  fetch_data("https://www.themuse.com/api/public/companies/#{museid}")
end

def create_company(obj)
  Company.create(name: obj["name"], description: obj["description"], locations: obj["locations"].map {|l| l["name"]}.join("|"), industries: obj["industries"].map {|i| i["name"]}.join("|"), twitter: obj["twitter"], muse_id: obj["id"], size: obj["size"]["short_name"], image: obj["refs"]["f1_image"], logo_image: obj["refs"]["logo_image"], muse_landing_page: obj["refs"]["landing_page"])
end



job_data.each do |j|
  co_museid = j["company"]["id"]
  if Company.find_by(muse_id: co_museid)
    c = Company.find_by(muse_id: co_museid)
  else
    c = create_company(get_company(co_museid))
    u = User.find(1)
    if c
      u.companies << c
    end
  end

  new_job = Job.new(contents: j["contents"], name: j["name"], publication_date: j["publication_date"], muse_id: j["id"], locations: j["locations"].map {|l| l["name"]}.join(";"),
  categories: j["categories"].map {|c| c["name"]}.join(";"), levels: j["levels"].map {|l| l["name"]}.join(";"), landing_page: j["landing_page"], company_id: c.id)


  if new_job.save
    a = App.create(user_id: 1, job_id: new_job.id, date_saved:DateTime.now)
    # new_job.update(app_id: a.id)
  else
    puts Job.create(contents: j["contents"], name: j["name"], publication_date: j["publication_date"], muse_id: j["id"], locations: j["locations"].map {|l| l["name"]}.join(";"),
    categories: j["categories"].map {|c| c["name"]}.join(";"), levels: j["levels"].map {|l| l["name"]}.join(";"), landing_page: j["landing_page"], company_id: c.id).errors.full_messages
  end
end
