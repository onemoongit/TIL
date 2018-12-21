# form-data VS x-www-form-urlencoded

### [stack overflow Summary](https://stackoverflow.com/questions/4007969/application-x-www-form-urlencoded-or-multipart-form-data/4073451#4073451)

if `you have binary (non-alphanumeric) data` (or a significantly sized payload) to transmit, use `multipart/form-data.` Otherwise, use `application/x-www-form-urlencoded`
