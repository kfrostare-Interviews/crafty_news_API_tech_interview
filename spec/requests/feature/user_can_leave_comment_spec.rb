RSpec.describe 'GET /api/articles/:id', type :request do
  let!(:article) { create(:article) }
    describe 'successfully' do
      before do
        get "/api/articles/#{article.id}"
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status 200
    end

    it 'returns correct article' do
      expect(response_json['article']['id']).to eq article.id
    end
  end

  describe 'user can comment' do
    it 'clicks the comment button' do
      click_on 'comment'
      fill_in 'This was bad'
      click_on 'post comment'
      expect(page).to have_content 'This was bad'
    end
  end
end