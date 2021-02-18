default: install

all: hooks install build

h help:
	@grep '^[a-z]' Makefile


.PHONY: hooks
hooks:
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push

install:
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle update


s serve:
	bundle exec jekyll serve --trace --livereload
i serve-i:
	bundle exec jekyll serve --trace --livereload --incremental

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace
