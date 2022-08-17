gawk '
BEGIN {
    FPAT = "([^,]+)|(\"[^\"]+\")"
    count=0
}
{
  if ($1 != "Worker") {
    print("<tr>")
    printf("%s", "<td>")
    printf("%s", $1)
    print("</td>")
    printf("%s", "<td>")
    printf("%s", $2)
    print("</td>")
    printf("%s", "<td>")
    printf("%s", substr($3, 2, length($3) - 2))
    print("</td>")
    print("</tr>")
    ++count
  }
}
END {
  printf("Number of entries: %s\n", count)
}
' FOI_2022.csv