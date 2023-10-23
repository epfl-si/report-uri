# Contributing

## Setup

```bash
git clone git@github.com:epfl-si/report-uri.git
cd report-uri
npm i
```

## Lint

```bash
npm run lint
```

## Run

Development

```bash
make start
```

Production

```bash
make up
```

## Deploy

### Prerequisites

- Access to EPFL WordPress Keybase teams (epfl_wp_test, epfl_wp_prod).
- Access to `wwp-test` and `wwp` namespaces on our OpenShift cluster.
- Logged in to OpenShift.

Clone [wp-ops](https://github.com/epfl-si/wp-ops) repository and from there, use the `wpsible` command:

Deploy in test

```bash
./ansible/wpsible -t report-uri
```

Deploy in production

```bash
./ansible/wpsible -t report-uri --prod
```

Re-Build image (build in test only)

```bash
./ansible/wpsible -t report-uri.rebuild
```

Promote image in production (build)

```bash
./ansible/wpsible -t report-uri.image.promote
```
