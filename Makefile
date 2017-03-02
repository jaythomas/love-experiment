test:
	docker build --quiet -t love-experiment . && \
	docker run love-experiment && \
	docker run love-experiment busted .
