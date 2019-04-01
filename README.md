# README

Hi! This is my solution to give real estate agents a better tool to make ther jobs easier!

⚠️ There were still a few features that I would've wanted to do but due time contraints I just did a simple API that 
returns properties within a 5km radius of a given coordinates.


## To run:

```
$ rails db:create
$ rails db:migrate
$ rails s
```

## To import properties dump
```
$ psql property_service_dev < properties.sql
```


Once your server is running please go to: `localhost:3000/v1/properties` and play with the params:

* lat
* lng
* property_type
* marketing_type

A request to the api should looks like this:

### Request:
```
localhost:3000/v1/properties?lng=13.4236807&lat=52.5342963&property_type=apartment&marketing_type=sell

```
### Response:

```
{
    "properties": [
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.531775",
            "lng": "13.388151",
            "price": "269700.0"
        },
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.53049",
            "lng": "13.379115",
            "price": "622500.0"
        },
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.53049",
            "lng": "13.379115",
            "price": "624300.0"
        },
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.53049",
            "lng": "13.379115",
            "price": "124000.0"
        },
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.53049",
            "lng": "13.379115",
            "price": "1267500.0"
        },
        {
            "type": "apartment",
            "house_number": null,
            "street": null,
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.53049",
            "lng": "13.379115",
            "price": "450000.0"
        },
        {
            "type": "apartment",
            "house_number": "22",
            "street": "Tieckstraße",
            "city": "Berlin",
            "zip_code": "10115",
            "lat": "52.530153",
            "lng": "13.390545",
            "price": "259300.0"
        }
    ]
}
```


## To run tests:
```
$ rails test
```


## Happy Hacking!



