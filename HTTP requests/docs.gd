### Methods

## request (HTTP CLIENT)
# request(url : String, custom_headers : PoolStringArray = PoolStringArray(), 
# ssl_validade_domain : bool = true, method : Method = 0, request_data : String = "")

# request -> signals request_completed

# request_completed(result : int, response_code : int, headers : PoolStringArray, 
# body : PoolStringArray)

### Enums

#Enum Method (HTTP CLIENT)
# Get = 0
# Post = 2
# Put = 3
# Delete = 4
# Patch = 8

#Enum ResponseCode (HTTP CLIENT)
# OK = 200
# Created = 201
# Bad request = 400
# Unauthorized = 401
# Forbidden = 403
# Couldnt find = 404
# Error = 0

#Enum Result (HTTP CLIENT)
# Sucess = 0
# Cant resolve = 3
# No response = 6
# Request Failed = 8
# Timeout = 12

#Enum Status (HTTP CLIENT)
# Disconnected = 0
# Connecting = 3
# Connected = 5
# Requestind = 6
# Body = 7
