class RepositoriesController < ApplicationController

  def index
    if query_params[:q]
      query = query_params[:q].gsub(/\s+/m, ' ').strip.split(' ').join('+')
      search_params = query + '&p=' + page_param(query_params[:p]).to_s
      @github = Github.new
      @result = @github.search(search_params)
    end
  
    render :index
  end

  private

  def page_param(param)
    page = param.to_i || 0

    (page >= 0 || page <= 100) ? page : 0
  end

  def query_params
    params.permit(:q, :p)
  end
end
