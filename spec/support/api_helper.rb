module ApiHelper
  def authenticated_header(request, user)
    auth_headers = Devise::JWT::TestHelpers.auth_headers(user)
    request.headers.merge!(auth_headers)
  end

  def json
    JSON.parse(response.body)
  end
end