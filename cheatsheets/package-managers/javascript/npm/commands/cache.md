# cache


- [npm cache](https://docs.npmjs.com/cli/v7/commands/npm-cache) docs.


## Clear cache

This will delete the cache of downloaded packages - these are not human-readable though.

```sh
$ npm cache clean --force
```

The clean command CLI and docs you to not use this unless you know what you are doing and also it only works with `--force` flag.

> clean: Delete all data out of the cache folder. Note that this is typically unnecessary, as npm's cache is self-healing and resistant to data corruption issues.

> ... For this reason, it should never be necessary to clear the cache for any reason other than reclaiming disk space, thus why clean now requires --force to run.

### Docker use

This command is ueful for making a Docker image smaller, as the cache is not needed for running.

I found this was recommended for Docker use. These are done as a single `RUN` step so it becomes one layer, which improves performance on rebuilding an image.

```Dockerfile
RUN npm install --loglevel warn && \
  npm cache clean --force
```
