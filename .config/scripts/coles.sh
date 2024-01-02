#!/bin/bash

ROOT_URL='https://www.coles.com.au/product'

# <Price>|<ProductID>
declare -a PRODUCT_IDS=(
  '$40.00|lavazza-espresso-barista-gran-crema-coffee-beans-1kg-3756513|Coffee Beans'
  '$5.20|tostitos-restaurant-style-smokin-chipotle-sour-cream-165g-6596322|Tostitos'
  '$8.00|nudie-pulp-oranges-juice-chilled-2l-7895759|Orange Juice'
  '$2.50|peckish-original-rice-crackers-90g-9999336|Pekish Crackers'
  '$3.00|liddells-lactose-free-full-cream-milk-1l-6706012|Lactose Free Milk'
  '$9.50|connoisseur-ice-cream-roasted-hazelnut-4-pack-400ml-5019356|Connoisseur Ice Cream'
  '$6.90|carman'\''s-dark-choc-espresso-nut-bar-5-pack-160g-1905237|Carmans Espresso Nut Bar'
  '$9.00|twisted-licks-rich-chocolate-zero-added-sugar-sticks-4-pack-320ml-3778083|Licks Ice Cream'
)

/Users/noahheague/.config/scripts/webhook.sh \
  -c "coles" \
  -m "Checking Prices..."

for PRODUCT in "${PRODUCT_IDS[@]}"
do
  EXPECTED_PRICE=$(echo $PRODUCT | cut -d "|" -f1)
  PRODUCT_ID=$(echo $PRODUCT | cut -d "|" -f2)
  PRETTY_NAME=$(echo $PRODUCT | cut -d "|" -f3)

  OUTPUT=$(curl -s "$ROOT_URL\/$PRODUCT_ID" \
    | /usr/local/bin/ggrep -oP "aria-label=\"Price .*?\"" \
    | cut -d \" -f2 \
    | cut -d " " -f2)

  if [[ "$OUTPUT" != "$EXPECTED_PRICE" ]] 
  then
    /Users/noahheague/.config/scripts/webhook.sh \
      -c "coles" \
      -m "$PRETTY_NAME is on sale! **$OUTPUT** (was $EXPECTED_PRICE)"
  fi
done

/Users/noahheague/.config/scripts/webhook.sh \
  -c "coles" \
  -m "All prices checked!"
