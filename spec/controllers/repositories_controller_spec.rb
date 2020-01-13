# frozen_string_literal: true

RSpec.describe RepositoriesController, type: :controller do
  describe '#index' do
    it 'fetches all github repository based on search query' do
      expect_any_instance_of(Github).to receive(:fetch)
      get :index, params: { q: 'Tetris' }
    end
  end
end
