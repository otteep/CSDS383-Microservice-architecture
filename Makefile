.PHONY: start stop restart logs validate run

start:
	docker-compose up -d

stop:
	docker-compose down
	-pkill -f "vite"

restart:
	docker-compose restart

logs:
	docker-compose logs -f krakend

validate:
	docker run --rm -v "$${PWD}/krakend/config:/etc/krakend" krakend:latest check -d -c /etc/krakend/krakend.json


run:
	@echo "Starting KrakenD..."
	@docker-compose up -d
	@echo "Waiting for KrakenD to start..."
	@sleep 2
	@echo "Starting frontend..."
	@cd client && npm run dev