# rch-preludetx-notes



## Scripts

### create_md.sh

This script creates a new markdown note file for the current date and updates the previous and next day links in the notes.

#### Usage

To create a new markdown note file, run:

```bash
./create_md.sh
```

The script will:

Generate a new markdown file with the current date in the `YYYY-MM-DD format`.

Update the links to the previous and next day's notes.

Append the new note to the summary file for the respective month.

```bash
rename-notes-header.sh
```

This script renames the headers of the markdown notes files to follow a consistent format
