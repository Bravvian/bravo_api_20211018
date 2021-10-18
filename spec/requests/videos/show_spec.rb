require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:videos) { create_list(:video, 2) }
  let(:params) { { id: videos.first.id } }

  describe "GET video" do

    before do
      videos
      get :show, params: params
    end

    context 'with valid request' do
      it 'responds with a status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'responds with the corresponded video' do
        expect(response.parsed_body['id']).to be(params[:id])
      end
    end
  end
end
