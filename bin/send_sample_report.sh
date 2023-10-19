#!/usr/bin/env bash

REPORT_URL="http://0.0.0.0:5050/csp-report"

CSP_REPORT='{
  "csp-report": {
    "document-uri": "http://example.com/connexion.html",
    "referrer": "https://google.com",
    "blocked-uri": "http://example.com/css/style.css",
    "violated-directive": "style-src cdn.example.com",
    "original-policy": "default-src 'none'; style-src cdn.example.com; report-uri /csp-report"
  }
}'

curl -X POST -H "Content-Type: application/csp-report" --data "$CSP_REPORT" "$REPORT_URL"
