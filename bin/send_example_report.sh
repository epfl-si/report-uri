#!/usr/bin/env bash

REPORT_URL="http://0.0.0.0:3636/csp-report"

CSP_REPORT='{
  "csp-report": {
    "document-uri": "https://example.com/page",
    "referrer": "https://google.com",
    "blocked-uri": "https://example.com/evil-script.js",
    "violated-directive": "script-src 'self' https://cdn.example.com",
    "original-policy": "script-src 'self'; report-uri /csp-report",
    "disposition": "report",
    "source-file": "https://example.com/page",
    "line-number": 10,
    "column-number": 123,
    "status-code": 200,
    "effective-directive": "script-src 'self'",
    "script-sample": "var x = document.createElement('script'); x.src = 'https://example.com/evil-script.js'; document.body.appendChild(x);"
  }
}'

curl -X POST -H "Content-Type: application/csp-report" --data "$CSP_REPORT" "$REPORT_URL"
