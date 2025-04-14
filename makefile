.PHONY: build migrate up down

build:
	cd book-service && docker build -t book-service .
	cd user-service && docker build -t user-service .

migrate:
	docker compose up -d book-db user-db
	until docker compose exec book-db pg_isready; do sleep 1; done
	until docker compose exec user-db pg_isready; do sleep 1; done
	migrate -path book-service/migrations -database "postgres://bookuser:bookpass@localhost:5432/bookdb?sslmode=disable" up
	migrate -path user-service/migrations -database "postgres://useruser:userpass@localhost:5433/userdb?sslmode=disable" up

up: build migrate
	docker compose up -d

down:
	docker compose down -v