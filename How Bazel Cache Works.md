# How Bazel Cache Works

## 🔹 Overview
Bazel cache is the mechanism that makes builds fast and incremental.  
It avoids rebuilding everything by reusing outputs of unchanged parts.

There are two types of caches:
1. **Local cache** → stored on your machine (`~/.cache/bazel/` or under `output_base`).
2. **Remote cache** → stored on a shared server (e.g., GCS, S3).

---

## 🔹 How It Works
- Bazel computes a **content hash** for each build action (based on inputs like source files, headers, compiler flags, deps, etc.).  
- That hash is checked against the cache:  
  - If found → **reuses the cached output**.  
  - If not found → Bazel rebuilds the action and stores the result with the new hash.

Outputs in the cache are **immutable**. If something changes, Bazel creates a new entry with a new hash — it does **not overwrite with deltas**.

---

## 🔹 Key Points
- Bazel does **not** store binary diffs or deltas.  
- Storage may grow since multiple past outputs can exist.  
- Repeated builds with the same inputs → **reuse cached results**.  
- Cleanup tools:
  - `bazel clean` → wipes local cache.  
  - `bazel clean --expunge` → wipes everything (including external repos).  
  - `--disk_cache` options can help limit growth.  

---

## 🔹 Does Bazel Only Update Changed Data?
Yes ✅  
- Bazel breaks the build into **fine-grained actions** (compile file, run test, link binary).  
- If inputs to an action **haven’t changed** → cached outputs are reused.  
- If inputs **changed** → only that action (and dependents) are rebuilt.  

This means only **changed/modified parts** are updated, while the rest is reused as it existed.

---

## 🔹 Example Project (C++)
WORKSPACE
BUILD
main.cc
foo.cc
foo.h
bar.cc
bar.h


### BUILD File
```python
cc_library(
    name = "foo",
    srcs = ["foo.cc"],
    hdrs = ["foo.h"],
)

cc_library(
    name = "bar",
    srcs = ["bar.cc"],
    hdrs = ["bar.h"],
)

cc_binary(
    name = "app",
    srcs = ["main.cc"],
    deps = [":foo", ":bar"],
)

🔹 Scenarios
1. First Build

Bazel compiles:

foo.cc → foo.o

bar.cc → bar.o

main.cc → main.o

Links them into app.

All outputs stored in cache with a hash.

2. Modify foo.cc

foo.o rebuilt.

bar.o and main.o reused from cache.

app relinked.

👉 Only foo.o + final binary rebuilt.

3. Modify bar.h

bar.o rebuilt (since bar.cc includes it).

foo.o and main.o reused.

app relinked.

👉 Only affected parts rebuilt.

4. No Changes

Bazel finds no input changes.

Prints:
  INFO: Build completed successfully, 0 total actions

🔹 Visual Flow

  Source Files → Hash Calculation → Cache Lookup
                        ↙                  ↘
       (Unchanged → Reuse Cache)    (Changed → Rebuild)
                                 ↘
                              Final Binary
Key Takeaway

Bazel reuses unchanged build outputs (object files, binaries, test results).

Only changed files + dependents are rebuilt.

No deltas, but fine-grained caching makes builds efficient.