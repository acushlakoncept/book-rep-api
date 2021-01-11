# README

## Consuming the API

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