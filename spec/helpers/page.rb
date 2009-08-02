module PageHelperMethods
  def cached_page_for(url)
    page = url[/s[0-9]{1,}.htm/]
    cached_page(page)
  end

  def cached_page(name)
    SPEC_DIR + "/pages/#{name}"
  end
end
