rebuild:
	docker-compose down -v --rmi local && docker-compose build --build-arg RAILS_MASTER_KEY=34c7feae72ec07f15f3e72bc487648c5

up:
	docker-compose up -d

migrate:
	docker-compose exec app bin/rails db:migrate

seed:
	docker-compose exec app bin/rails db:seed
