## Running the Project

Clone repositories into bookswap-platform

```bash
    mkdir bookswap-platform
    cd bookswap-platform
    git clone https://K4isik/Go-Final-Project/book-service.git
    git clone https://K4isik/Go-Final-Project/user-service.git
```

## Install migrate

```bash
    go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

## Run everything with one command:

```bash
    make up
```

1. Builds Docker images
1. Applies migrations
1. Starts services

## Access:

- Book Service: http://localhost:8080
- User Service: http://localhost:8081
