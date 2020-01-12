class RepositoriesController < ApplicationController

  def index
    if query_params
      query = query_params.gsub(/\s+/m, ' ').strip.split(' ').join('+')
      @result = Github.new.search(query)
    end
    render :index
  end

  def show
  end

  private

  def query_params
    params.permit(:q)[:q]
  end
end
