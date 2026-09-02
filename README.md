# macOS Screenshot Organizer

A small Bash utility that keeps macOS screenshots from accumulating on the Desktop by moving them into folders organized by year and month.

## Example

Before:

```text
Desktop/
├── Screenshot 2026-08-10 at 9.12.01 AM.png
├── Screenshot 2026-08-22 at 4.31.44 PM.png
└── Screenshot 2026-09-01 at 10.03.12 PM.png
```

After:

```text
Desktop/
└── Screenshots/
    └── 2026/
        ├── 08/
        │   ├── Screenshot 2026-08-10 at 9.12.01 AM.png
        │   └── Screenshot 2026-08-22 at 4.31.44 PM.png
        └── 09/
            └── Screenshot 2026-09-01 at 10.03.12 PM.png
```

## Run

```bash
chmod +x sort_screenshots.sh
./sort_screenshots.sh
```

## How It Works

The script:

1. Finds screenshot PNG files on the macOS Desktop.
2. Parses the year and month from the screenshot filename.
3. Creates the appropriate destination directory.
4. Moves the screenshot into `~/Desktop/Screenshots/<year>/<month>/`.

`find -print0` is used so filenames containing spaces are handled safely.

## Limitations

The current version expects the standard macOS screenshot filename format. Localized macOS installations or customized screenshot naming may require adjusting the regular expression.

## Next Steps

- Add a dry-run mode
- Support additional screenshot filename formats
- Add an optional LaunchAgent for automatic execution
- Add shell tests
