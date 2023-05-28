# elixire2docker

This is a Dockerfile + Compose file for [elixire](https://gitlab.com/elixire/elixire).
It hosts Elixire (which requires Redis and Postgresql) for a single domain. 

This repo requires a [config.py from here](https://gitlab.com/elixire/elixire/-/blob/master/config.py.example) to be deployable. 
Fill out the file, disable the frontend and replace host names with Docker container names.
You also should change `ENV HOST=` to match your config.py in `Dockerfile`.
