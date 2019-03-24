require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create(username: "siobhan", password: "siobhan")

### function: get job data => save company, save job

def job_data
  fetch_data('https://www.themuse.com/api/public/jobs?category=Engineering&level=Entry%20Level&page=1&api-key=21e388d693a736a2740522eedb2b9523e2d05d1947214da771db0d4a8f5c517e')["results"]
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
  Company.create(name: obj["name"], description: obj["description"], locations: obj["locations"].map {|l| l["name"]}.join(";"), industries: obj["industries"].map {|i| i["name"]}.join(";"), twitter: obj["twitter"], muse_id: obj["id"], size: obj["size"]["short_name"])
end



job_data.each do |j|
  co_museid = j["company"]["id"]
  if Company.find_by(muse_id: co_museid)
    c = Company.find_by(muse_id: co_museid)
  else
    c = create_company(get_company(co_museid))
  end

  new_job = Job.create(contents: j["contents"], name: j["name"], publication_date: j["publication_date"], muse_id: j["id"], locations: j["locations"].map {|l| l["name"]}.join(";"),
  categories: j["categories"].map {|c| c["name"]}.join(";"), levels: j["levels"].map {|l| l["name"]}.join(";"), landing_page: j["landing_page"], company_id: c.id)

  puts new_job.id

  App.create(user_id: 1, job_id: new_job.id, date_saved:DateTime.now)
end
