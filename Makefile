test:
	docker build --quiet -t love-experiment . && \
	docker run love-experiment && \
	docker run love-experiment sh -c "busted . && luacov-coveralls -e usr/ -e lib/ -e .spec.lua --dryrun"
