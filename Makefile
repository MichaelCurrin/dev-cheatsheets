default: install

help:
	@egrep '^\S|^$$' Makefile

install:
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve --trace --livereload

build-prod:
	JEKYLL_ENV=production bundle exec jekyll build
