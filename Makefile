default: install

help:
	@egrep '^\S|^$$' Makefile

.PHONY: hooks
hooks:
	# Don't use -r flag as it is not widely compatible.
	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push
	ls -l ./.git/hooks/pre-push

install:
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve --trace --livereload
i serve-i:
	bundle exec jekyll serve --trace --livereload --incremental


build-dev:
	bundle exec jekyll build

build-prod:
	JEKYLL_ENV=production bundle exec jekyll build
