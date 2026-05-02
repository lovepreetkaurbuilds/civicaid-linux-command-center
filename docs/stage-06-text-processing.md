# Stage 6: Linux Text Processing

This stage demonstrates practical Linux text-processing skills using CivicAid sample data.

## Commands practiced

- echo
- grep
- find
- wc
- sort
- uniq
- cut
- awk
- sed

## Practical tasks completed

1. Searched high urgency help requests using grep.
2. Counted total volunteers using wc.
3. Extracted CSV columns using cut.
4. Sorted and counted unique categories using sort and uniq.
5. Filtered donations above 5000 using awk.
6. Previewed text replacement using sed.
7. Found project files using find.

## Example commands

```bash
grep "high" data/help_requests.csv
tail -n +2 data/volunteers.csv | wc -l
tail -n +2 data/help_requests.csv | cut -d "," -f 4 | sort | uniq -c
awk -F "," '$3 > 5000 {print $1, $2, $3, $5}' data/donations.csv
sed 's/pending/open/g' data/help_requests.csv > reports/help_requests_open_preview.txt

