require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:videos) { create_list(:video, 2) }


  describe "GET videos list" do

    before do
      videos
      get :index
    end

    context 'with valid request' do
      it 'responds with a status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'responds with 2 videos' do
        expect(response.parsed_body.size).to be(2)
      end
    end
  end
end
