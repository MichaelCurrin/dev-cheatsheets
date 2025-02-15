# awk

`awk` is a powerful tool for processing CSV files. Here's a breakdown of how to use it for common CSV tasks:

Statements are terminated by semicolons, newlines or right braces. 


## Important Notes

*   For very complex CSV files with nested quotes, escaped characters, or other intricacies, using a dedicated CSV parsing tool is highly recommended.  `awk` is best for simpler CSV structures.
*   The examples above assume a consistent CSV format. Inconsistent formatting can lead to incorrect results.
*   Always test your `awk` commands on a small sample of your CSV file first to ensure they are working as expected.



## Setting the Field Separator

CSV files use commas (`,`) as delimiters.  You tell `awk` to use a comma as the field separator with the `-F` option:

```bash
awk -F, '{print $1, $2}' your_file.csv
```

This will print the first and second fields of each line in `your_file.csv`.

## Printing Specific Fields

*   `$1`, `$2`, `$3`, etc., represent the first, second, third, and so on, fields.
*   `$0` represents the entire line.

```bash
awk -F, '{print $1}' your_file.csv       # Print the first field
awk -F, '{print $2, $4}' your_file.csv    # Print the second and fourth fields
awk -F, '{print $0}' your_file.csv       # Print the entire line
```

##  Printing with Custom Formatting

You can combine fields with strings and other formatting:

```bash
awk -F, '{print "Name:", $1, "Age:", $2}' your_file.csv
```

This will print `"Name: [value of first field] Age: [value of second field]"` for each line.

## Filtering Records

You can filter lines based on conditions:

```bash
awk -F, '$3 > 30 {print $1, $2, $3}' your_file.csv  # Print lines where the third field is greater than 30
awk -F, '$1 == "John" {print $0}' your_file.csv     # Print lines where the first field is "John"
awk -F, '$2 ~ /Smith/ {print $0}' your_file.csv    # Print lines where the second field contains "Smith" (using a regular expression)
```

##  Calculating Totals and Averages

```bash
awk -F, '{sum += $3} END {print "Total:", sum, "Average:", sum/NR}' your_file.csv
```

*   This calculates the sum of the third field.
*   `NR` is the total number of records (lines).
*   The `END` block is executed after processing all lines.

##  Adding a Header

If your CSV doesn't have a header, you can add one:

```bash
awk -F, 'NR==1 {print "Name,Age,Salary"} {print $1,$2,$3}' your_file.csv
```

*   `NR==1` checks if it's the first record.

##  Handling Quoted Fields

CSV files often have quoted fields.  `awk`'s default field splitting might not handle this correctly.  For more robust CSV parsing, consider using a dedicated CSV parser like `csvkit` or Python's `csv` module.  However, for simple cases, you can sometimes use `FPAT` (field pattern) for quoted fields if your `gawk` version supports it:

```bash
gawk -F, -v FPAT='"([^"]*)"|([^,]*)' '{print $1, $2}' your_file.csv
```

This `FPAT` setting attempts to handle quoted fields (content between double quotes) and unquoted fields.  Be careful, and test this thoroughly, as complex CSV files might require a dedicated parser.

**Example CSV (`your_file.csv`):**

```
Name,Age,Salary
John,30,50000
Jane,25,60000
Peter,35,70000
Mary,28,55000
```

**Example Usage and Output:**

```bash
awk -F, '{print $1, $3}' your_file.csv
```

Output:

```
Name Salary
John 50000
Jane 60000
Peter 70000
Mary 55000
```
