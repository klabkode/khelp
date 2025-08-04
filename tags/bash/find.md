# Find Command Usage

## List Files

```bash
find
# or
find .
```

## List Files with Realpath

```bash
find "$PWD"
# or
find "$(realpath .)"
```

## Find Files by Type

```bash
find -type f        # Find regular files
find -type d        # Find directories
find -executable    # Find executables and directories
```

## Find Files and Sort Results

```bash
find . -name "*.h" -exec dirname {} \; | sort > sorted.txt
```

## Find Files and Run 'bashcov' Command for Each File

```bash
find /path/to/your/project -type f -name "*.sh" -exec bashcov {} \;
```
