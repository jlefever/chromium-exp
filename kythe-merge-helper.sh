# echo "merging 0...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-0.kzip $KYTHE_OUTPUT_DIRECTORY/0*.kzip;

# echo "merging 1...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-1.kzip $KYTHE_OUTPUT_DIRECTORY/1*.kzip;

# echo "merging 2...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-2.kzip $KYTHE_OUTPUT_DIRECTORY/2*.kzip;

# echo "merging 3...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-3.kzip $KYTHE_OUTPUT_DIRECTORY/3*.kzip;

# echo "merging 4...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-4.kzip $KYTHE_OUTPUT_DIRECTORY/4*.kzip;

# echo "merging 5...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-5.kzip $KYTHE_OUTPUT_DIRECTORY/5*.kzip;

# echo "merging 6...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-6.kzip $KYTHE_OUTPUT_DIRECTORY/6*.kzip;

# echo "merging 7...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-7.kzip $KYTHE_OUTPUT_DIRECTORY/7*.kzip;

# echo "merging 8...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-8.kzip $KYTHE_OUTPUT_DIRECTORY/8*.kzip;

# echo "merging 9...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-9.kzip $KYTHE_OUTPUT_DIRECTORY/9*.kzip;

# echo "merging a...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-a.kzip $KYTHE_OUTPUT_DIRECTORY/a*.kzip;

# echo "merging b...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-b.kzip $KYTHE_OUTPUT_DIRECTORY/b*.kzip;

# echo "merging c...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-c.kzip $KYTHE_OUTPUT_DIRECTORY/c*.kzip;

# echo "merging d...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-d.kzip $KYTHE_OUTPUT_DIRECTORY/d*.kzip;

# echo "merging e...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-e.kzip $KYTHE_OUTPUT_DIRECTORY/e*.kzip;

# echo "merging f...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged-f.kzip $KYTHE_OUTPUT_DIRECTORY/f*.kzip;

# echo "merging all...";
# /opt/kythe/tools/kzip merge --output $KYTHE_OUTPUT_DIRECTORY/merged.kzip $KYTHE_OUTPUT_DIRECTORY/merged-*.kzip;

echo "creating entries-dups...";
/opt/kythe/indexers/cxx_indexer --ignore_unimplemented $KYTHE_OUTPUT_DIRECTORY/merged.kzip > $KYTHE_OUTPUT_DIRECTORY/entries-dups;

echo "creating entries..."
cat $KYTHE_OUTPUT_DIRECTORY/entries-dups | /opt/kythe/tools/dedup_stream > $KYTHE_OUTPUT_DIRECTORY/entries;

echo "creating entries.gz...";
cat $KYTHE_OUTPUT_DIRECTORY/entries | gzip > $KYTHE_OUTPUT_DIRECTORY/entries.gz;

echo "creating entries-dd.jsonl...";
cat $KYTHE_OUTPUT_DIRECTORY/entries | /opt/kythe/tools/entrystream --sort --write_format=json > $KYTHE_OUTPUT_DIRECTORY/entries.jsonl;

echo "creating entries.jsonl.gz...";
cat $KYTHE_OUTPUT_DIRECTORY/entries.jsonl | gzip > $KYTHE_OUTPUT_DIRECTORY/entries.jsonl.gz;