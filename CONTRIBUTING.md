# Contributing

## Prerequisites

* Be member of the [Keybase] `/keybase/team/epfl_wp_prod/` team.
* Be member of the EPFL group `vra_p_svc0041`.

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

## Test

```bash
make send-sample-report
```

## Deploy

Clone [wp-ops](https://github.com/epfl-si/wp-ops) repository and **from there**, use the `wpsible` command:

```bash
./ansible/wpsible -t report-uri      # (--prod for production environment)
```

Start a new "cloud" build (build in test only)

```bash
./ansible/wpsible -t report-uri.startbuild
```

Restart the app

```bash
./ansible/wpsible -t report-uri.restart`    # (--prod for production environment)
```
