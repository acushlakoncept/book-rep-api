# README

## Consuming the API

**Register user**
POST `http://localhost:3001/api/v1/register`
```json
{
    "user": {
    "username": "test_user",
    "password": "password"
}
}
```

**Authenticate**
POST `http://localhost:3001/api/v1/authenticate`
```json
{
    "username": "test_user",
    "password": "password"
}

// Results

{
    "id": 1,
    "username": "test_user",
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MTA1NDI0NzN9.BJvTC6OZliHC2FwSDXZTLTH55ZHQ_hZ02BAL1arr0mY"
}
```


**POST New Book**
POST `http://localhost:3000/api/v1/books`

```json
{
    "author": {
    "first_name": "Uduak",
    "last_name": "Essien",
    "age": 35
},
  "book": {
      "title": "Rails Upload Methods"
  }
}
```