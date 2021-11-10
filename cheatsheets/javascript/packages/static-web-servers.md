---
title: Static web servers
description: A selection of Node packages which can be used to serve static assets
---

These are typically for local dev servers including static HTML or built output for Single-Page Apps like React.

These could be used in production too, but you should probably add something like Ngninx on top as a load balancer.

See also this [gist](https://gist.github.com/MichaelCurrin/1a6116a4e0918c8468dc7e1a701a5f95) which links here and shows options outside of Node.


## Notes

- Single-Page App mode like React, some support a flag like `-s,--single`, that is for . All not-found requests will go to `index.html`.
- CORS mode - enable CORS to set `Access-Control-Allow-Origin` to `*`.
- The base functionality will mostly be the same across packages. Some will have additional functionality like having a build command for production build, or features to enable with flags.


## Packages and instructions

The instructions are for global install but also work at the project level.

Or use `npx` to run without installing (useful if you want to try out a few and get the latest version but slow to call each time).

You can also add the run commands to `package.json`. e.g. for `start` you can put `serve -p 8080`.

In alphabetical order:

- [glance](https://www.npmjs.org/package/glance)
- [harp](http://harpjs.com/)
- [http-server](https://www.npmjs.com/package/http-server)
    - Install and run.
        ```sh
        $ npm i -g http-server
        $ http-server -a localhost
        ```
- [live-server](https://www.npmjs.com/package/live-server)
    - > A great zero-config HTTP server with live reload capability.
    - Run with `npx`:
        ```sh
        $ npx live-server
        ```
    - Install and run.
        ```sh
        $ npm i -g live-server
        $ live-server
        ```
- [serve](https://www.npmjs.com/package/serve)
    - > Static file serving and directory listing 
    - Created by the Vercel team.
    - This was recommended to me by React CLI when doing a build.
    - Run with `npx`:
        ```sh
        $ npx serve
        ```
    - Install and run.
        ```sh
        $ npm i -g serve
        $ serve
        $ serve build --single
        $ serve -p 8080 
        ```
- [serve-static](https://www.npmjs.com/package/serve-static)
- [simple-server](https://www.npmjs.com/package/simple-server)
    - Install and run.
        ```sh
        $ npm i -g simple-server
        $ simple-server public 3000
        ```
- [sirv](https://www.npmjs.com/package/sirv) and [sirv-cli](https://github.com/lukeed/sirv/tree/master/packages/sirv-cli)
    - > You may use `sirv` as a very fast and lightweight alternative to `serve-static`.
    - Run with `npx`:
        ```sh
        $ npx sirv-cli
        ```
    - Install and run:
        ```sh
        $ npm i -g sirv
        
        $ # Serve.
        $ sirv
        
        $ # Dev mode
        $ sirv --dev
        
        $ # Open access to requests on the network.
        $ sirv --host
        $ sirv --port 8080 --cors --single
        
        $ # Target a directory.
        $ sirv build
        $ sirv public
        ```
