# produces an output value named "pokemon"
output "pokemon" {
  description = "API that documents folks in space"
  value       = data.http.iss.response_body
}

# produces legal JSON output value named "pokemon_json"
output "pokemon_json" {
  description = "API that documents folks in space"
  value       = jsondecode(data.http.iss.response_body)    // note the jsondecode()
}    
