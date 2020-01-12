
class Github
  def initialize
    @host = 'https://api.github.com'
  end

  def search(query)
    path = '/search/repositories?q='
    fetch(@host + path + query)
  end

  private

  def fetch(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
