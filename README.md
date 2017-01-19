# Love Experiment

[![Build Status](https://travis-ci.org/jaythomas/love-experiment.svg?branch=master)](https://travis-ci.org/jaythomas/love-experiment)
[![License](https://img.shields.io/badge/License-LGPL%203.0-brightgreen.svg)](LICENSE)

A test game made using:
- Lua LOVE
- ECS-inspired designs
- Docker-container-driven testing
- And other nifty stuff!

## Testing

1. Build docker container

```sh
docker build -t love-experiment .
```

2. Run the container

```
docker run love-experiment
```

And there you go. It should spit out test results.
