coverage_report=""
for file in $(find src -type f); do
  if [[ $file != "src/setupProxy.js" &&  $file == *.js ]]; then
    # coverage_report=$coverage_report$(yarn flow coverage --quiet $file | awk -F ': ' '{print $2}')
    coverage_report=$coverage_report"| $file | $(yarn flow coverage --quiet $file | awk -F ': ' '{print $2}') |\n"
  fi
done

echo $coverage_report
