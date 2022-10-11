# get a list of files that are changed from master
changed_files=$(git diff --name-only master | grep "\.py")
# remove deleted files and anything in tests/
changed_files=$(ls $changed_files 2>/dev/null | grep -v "tests/")
echo ""
echo ""
echo "Checking style for files:"
stringarray=($changed_files)
for i in "${stringarray[@]}"
do
  echo $i
  # do whatever on $i
done
echo ""
echo ""
# flake8, format checker
echo " --> flake8"
flake8 $changed_files
# black, check format using -S which ignores single quotes
echo " --> black"
black -S --line-length 79 --check $changed_files -q
# darglint, check doc strings
echo " --> darglint"
darglint $changed_files
# mypy, check typehints
echo " --> mypy"
mypy $changed_files
