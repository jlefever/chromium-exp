1. Initial setup
```
mkdir ~/source/chromium && cd ~/source/chromium
fetch --nohooks chromium
cd src
gclient runhooks
```

2. Generate build files
```
gn gen out/KytheInputF --args="blink_enable_generated_code_formatting = true clang_use_chrome_plugins = false enable_kythe_annotations = true is_clang = true is_component_build = true is_debug = true symbol_level = 1"
```

3. Generate compile_commands.json
```
python3 tools/clang/scripts/generate_compdb.py -p out/KytheInputF/ -o out/KytheInputF/compile_commands.json all
```

4. Generate gn_targets.json
```
gn desc out/KytheInputF "*" --format=json > out/KytheInputF/gn_targets.json
```

5. Ensure kzip dir exists
```
mkdir out/KytheInputF/kzip
```

6. Build
```
autoninja -C out/KytheInputF -k 0
```