function ezdig() {
  CNAME="$(dig @1.1.1.1 $1 CNAME | sed -n -e '/ANSWER SECTION/,/;;/ p' | sed -n '/^[a-z]/p')"
  NS="$(dig @1.1.1.1 $1 NS | sed -n -e '/ANSWER SECTION/,/;;/ p' | sed -n '/^[a-z]/p')"
  A="$(dig @1.1.1.1 $1 A | sed -n -e '/ANSWER SECTION/,/;;/ p' | sed -n '/^[a-z]/p')"
  MX="$(dig @1.1.1.1 $1 MX | sed -n -e '/ANSWER SECTION/,/;;/ p' | sed -n '/^[a-z]/p')"

  if [[ -z "${CNAME// }" ]] then; else; echo "$GREEN_TEXT\0CNAME:$DEFAULT_TEXT\n$CNAME\n\n"; fi;
  if [[ -z "${NS// }" ]] then; else; echo "$GREEN_TEXT\0NS:$DEFAULT_TEXT\n$NS\n\n"; fi;
  if [[ -z "${A// }" ]] then; else; echo "$GREEN_TEXT\0A:$DEFAULT_TEXT\n$A\n\n"; fi;
  if [[ -z "${MX// }" ]] then; else; echo "$GREEN_TEXT\0MX:$DEFAULT_TEXT\n$MX"; fi;
}
