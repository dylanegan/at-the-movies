module PageHelperMethods
  def cached_page_for(url)
    page = url[/s[0-9]{1,}.htm/]
    SPEC_DIR + "/pages/#{page}"
  end
end
