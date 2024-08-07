PROJECT_NAME = Bio Attendance System

conda-env:
	conda create -n bas_env python=3.9 -y

client-deps:
	cd client && npm install

server-deps:
	cd server && npm install
	
match-server-deps:
	pip install -r ./server-py/requirements.txt

client-server:
	npm --prefix ./server run dev

core-server:
	npm --prefix ./server run server:prod

match-server:
	python ./server-py/server.py

dev-migrate:
	npm --prefix ./server run migrate:dev

core-server-env:
	copy .\server\.env.example .\server\.env

.PHONY: conda-env client-deps server-deps match-server-deps client-server core-server match-server dev-migrate