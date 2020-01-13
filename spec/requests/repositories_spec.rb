# frozen_string_literal: true

RSpec.describe RepositoriesController, type: :request do
  describe '#index' do
    it 'shows the page' do
      get repositories_path, params: { q: 'Tetris' }
      expect(response.status).to eq 200
    end
  end
end
