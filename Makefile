.DEFAULT_GOAL := help
help: 
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help 

##
##-----------------------------------------
##     P O T E N T I A L   E N I G M A
##-----------------------------------------


install:
	git submodule update --init
	(cd ws-api; make install)
	yarn
	git submodule foreach 'yarn && yarn build'

start: ## All-in-one command to start front & back project
start: install
	yarn start
	yarn open

stop: ## Remove PM2 processes
stop: 
	yarn delete