# Ice House

A containerised offline npm cache built on top of [Verdaccio](https://verdaccio.org/).

## Getting Started

### Seeding the cache while online

- `docker-compose up`

### Using the cache while offline

- `docker-compose start verdaccio`
- `npm install <some package> --registry=http://localhost:4873`
