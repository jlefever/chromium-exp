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

7. Download translatation_unit tool
```
mkdir mytemp
python3 -u tools/clang/scripts/update.py --package=translation_unit --output-dir=mytemp
```

8. Run translation_unit tool. Errors are expected.
```
python2 tools/clang/scripts/run_tool.py --tool translation_unit --tool-path mytemp/bin -p out/KytheInputF --all
```

9. Run add_kythe_metadata.py.  Errors are expected.
```
git clone https://chromium.googlesource.com/chromium/tools/build/ ~/source/chromium-tools-build
python2 ~/source/chromium-tools-build/recipes/recipe_modules/codesearch/resources/add_kythe_metadata.py --corpus chromium.googlesource.com/chromium/src out/KytheInputF/
```

10. Download package_index tool
```
mkdir -p mytemp2/root
echo "infra/tools/package_index/linux-amd64 n7uPKoIlk_65MaWh11WTaC4gPwtpC9pVF2h_tKfEVQoC" > mytemp2/ensurefile
cipd ensure -root mytemp2/root -ensure-file mytemp2/ensurefile -max-threads 0
```

11. Run package_index tool
```
cd ..
src/mytemp2/root/package_index --checkout_dir src/ --path_to_compdb src/out/KytheInputF/compile_commands.json --path_to_gn_targets src/out/KytheInputF/gn_targets.json --path_to_archive_output src/out/KytheInputF/chromium_linux.kzip --corpus chromium.googlesource.com/chromium/src --project chromium --path_to_java_kzips src/out/KytheInputF/kzip --out_dir src/out/KytheInputF --build_config linux
```

12. The package_index tool didn't work. Try
```
/opt/kythe/tools/runextractor compdb -extractor /opt/kythe/extractors/cxx_extractor
```
The kzip's produced by this seem to work with the cxx_indexer.