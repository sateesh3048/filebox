module DocumentsHelper
  def short_url(url)
    "#{request.protocol}#{request.host_with_port}/#{url}"
  end
end
