#!/bin/sh
API="https://api.huobi.pro/market/trade"

quote=$(curl -sf "$API?symbol=btcusdt" | jq -r ".tick.data[0].price")
quote=$(LANG=C printf "%.2f" "$quote")

echo "%{F#80FFFFFF}ﴑ%{F-} $quote \$"
