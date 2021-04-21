require "http/client"

searchQuery = "cheddar cheese" # This will eventually get replaced with some input form
@apiKey = "vd8YmToLrVtMbQqGvqjpDvE8agw6KVi8Xdon1cPU" # Eventually the api_key will get moved to a more secure location
@apiUrl = "https://api.nal.usda.gov"
host = "api.nal.usda.gov"
@apiEndpoint = "/fdc/v1/foods/search"

def queryApi(query : String)
  opts = HTTP::Headers{"api_key" => apiKey, "query" => query}
  searchUri : String = "#{apiUrl}#{apiEndpoint}"
  response = HTTP::Client.get(searchUri, headers: opts)
  if !response.status_code?("200")
    puts "Uh oh! Something went wrong."
    puts "The status code returned is: #{response.status_code}"
  end
  return response.body
end

q = queryApi("cheddar cheese")
return q