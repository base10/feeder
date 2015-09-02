module FeedsHelper
  def domain(url)
    uri = URI(url)
    uri.host
  end
end
