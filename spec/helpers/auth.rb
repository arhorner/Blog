module AuthHelpers
  def visit_auth(path)
    visit "http://admin:password@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
end