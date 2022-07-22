import json
import sys


if __name__ == "__main__":
    fact_names = set()
    for line in sys.stdin:
        obj = json.loads(line)
        if "edge_kind" in obj:
            continue
        if "path" not in obj["source"]:
            continue
        if obj["source"]["path"].startswith("/"):
            continue
        print(obj)
        # edge_kind = obj["edge_kind"]
        # if edge_kind != "/kythe/edge/ref/call":
        #     continue
        # if obj["source"]["signature"] == "4QRGULXXlYbxFMSGGIgNzNqdRud07mfBWd66aLQk3os":
        #     print(obj)
        # print(obj)
        # print(list(obj.keys()))
        # if "kind" in obj:
        #     print(obj["kind"])