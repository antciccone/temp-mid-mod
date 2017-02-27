require 'rails_helper'


describe 'index' do
  context 'api/vi/links' do
    it 'returns top ten read links' do
      Link.create(title: "google", url: "https://www.google.com/", read: true, created_at: "2017-02-27 22:25:36", updated_at: "2017-02-27 22:25:46", user_id: nil)
      Link.create(title: "yahoo", url: "https://www.yahoo.com/", read: true, created_at: "2017-02-27 22:25:36", updated_at: "2017-02-27 22:25:46", user_id: nil)
      Link.create(title: "espn", url: "https://www.espn.com/", read: false, created_at: "2017-02-27 22:25:36", updated_at: "2017-02-27 22:25:46", user_id: nil)

      get '/api/v1/links'

      links = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)

      expect(links.count).to eq(2)
      expect(links.first["url"]).to eq('https://www.google.com/')
      expect(links.second["url"]).to eq('https://www.yahoo.com/')
    end
  end
end
