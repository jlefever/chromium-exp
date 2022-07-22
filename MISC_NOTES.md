```
/opt/kythe/tools/kythe -api serving nodes kythe://leveldb?path=db/skiplist.h
```

```
/opt/kythe/indexers/cxx_indexer --ignore_unimplemented kzips/merged.kzip | /opt/kythe/tools/dedup_stream > entries
cat entries | /opt/kythe/tools/entrystream --entrysets > entries.jsonl
cat entries.jsonl | gzip > entries.jsonl.gz
```
