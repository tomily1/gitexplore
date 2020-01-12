class RepositoriesController < ApplicationController

  def index
    if query_params[:q]
      query = query_params[:q].gsub(/\s+/m, ' ').strip.split(' ').join('+')
      search_params = query + '&page=' + page_param(query_params[:page]).to_s
      @github = Github.new
      @result = Rails.cache.fetch(search_params, :expires_in => 2.minutes) do
        @github.search(search_params)
      end
    end
  
    render :index
  end

  private

  def page_param(param)
    page = param.to_i || 1

    (page >= 1 || page <= 100) ? page : 1
  end

  def query_params
    params.permit(:q, :page)
  end
end
