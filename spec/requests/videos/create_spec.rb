# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:category) { create(:category) }
  let(:file) { fixture_file_upload( File.open('spec/mocks/video_mock_1.mp4'), 'video/mp4') }
  let(:invalid_file) { fixture_file_upload( File.open('spec/mocks/video_mock_2.m4v'), 'video/m4v') }
  let(:thumbnail) { fixture_file_upload( File.open('spec/mocks/thumbnail_1.jpg')) }
  let(:ok_params) do
    {
      file: file,
      title: 'Title_1',
      category_id: category.id,
      thumbnail: thumbnail
    }
  end

  let(:not_ok_params) do
    {
      file: invalid_file,
      title: 'Title_1',
      category_id: category.id,
      thumbnail: thumbnail
    }
  end

  let(:bad_params) { {} }

  describe 'CREATE video' do
    before do
      category
      post :create, params: ok_params
    end

    context 'with valid params' do
      it 'responds with a status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'create with the attached file' do
        expect(Video.last.file.attached?).to be(true)
      end

      it 'create with 4 attached thumbnails' do
        expect(Video.last.thumbnail.attached?).to be(true)
        expect(Video.last.thumbnail_64x64.attached?).to be(true)
        expect(Video.last.thumbnail_128x128.attached?).to be(true)
        expect(Video.last.thumbnail_256x256.attached?).to be(true)
      end
    end
  end
end
